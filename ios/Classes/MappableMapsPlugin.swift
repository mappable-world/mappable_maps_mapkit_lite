import Flutter
import UIKit
import MappableMobile

public class MappableMapsPlugin: NSObject, FlutterPlugin {
  private var _viewFactory: NativeViewFactory
    
  init(registrar: FlutterPluginRegistrar) {
        _viewFactory = NativeViewFactory(messenger: registrar.messenger())
        registrar.register(_viewFactory, withId: "flutter_mappable_maps_view_factory")
  }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      
      let channel = FlutterMethodChannel(name: "flutter_mappable_mapkit/view", binaryMessenger: registrar.messenger())
      let channel2 = FlutterMethodChannel(name: "flutter_mappable_mapkit/runtime", binaryMessenger: registrar.messenger())
      let instance = MappableMapsPlugin(registrar: registrar)
      
      registrar.addMethodCallDelegate(instance, channel: channel)
      registrar.addMethodCallDelegate(instance, channel: channel2)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "getViewPtr") {
          let args = call.arguments as! Dictionary<String, Any>
          let id = args["id"] as! Int64
          
          result(self._viewFactory.getViewPtr(id: id))
      } else if (call.method == "init") {
          let args = call.arguments as! Dictionary<String, Any>
          let options = args["options"] as! Dictionary<String, String>
          MRTRuntime.setPreinitializationOptions(options)
          result(nil)
      } else if (call.method == "startView") {
          let args = call.arguments as! Dictionary<String, Any>
          let id = args["id"] as! Int64
            
          self._viewFactory.startView(id: id)
          result(nil)
      }
  }
}
