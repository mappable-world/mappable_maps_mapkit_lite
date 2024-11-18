import Flutter
import UIKit
import MappableMobile

class WeakView {
    weak var value: NativeView?
    init (value: NativeView) {
        self.value = value
    }
}

class NativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    private var views = [Int64: WeakView]()

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        var view = NativeView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger, factory: self)
        views[viewId] = WeakView(value: view)
        return view
    }

    public func getViewPtr(id: Int64) -> Int64 {
        return views[id]!.value!.getViewPtr()
    }

    public func startView(id: Int64) {
        views[id]!.value!.start()
    }

    public func stopView(id: Int64) {
        views.removeValue(forKey: id)
    }
}

class NativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    private var _lifecycleProvider: MRTFlutterLifecycleProvider
    private var _viewId: Int64
    private var _factory: NativeViewFactory

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?,
        factory: NativeViewFactory
    ) {
        _lifecycleProvider = MRTFlutterViewFactory.createLifecycleProvider();
        _view = MRTFlutterViewFactory.createPlatformView(frame, lifecycleProvider: _lifecycleProvider);
        _viewId = viewId
        _factory = factory
        super.init()
    }

    deinit {
        _factory.stopView(id: _viewId)
    }


    func getViewPtr() -> Int64 {
        return MRTFlutterViewFactory.getPlatformViewAddress(_view)
    }

    func start() {
        return MRTFlutterViewFactory.startPlatformView(_view, lifecycleProvider: _lifecycleProvider)
    }

    func view() -> UIView {
        return _view
    }
}
