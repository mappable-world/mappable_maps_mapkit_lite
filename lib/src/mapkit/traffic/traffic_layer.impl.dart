part of 'traffic_layer.dart';

@bindings_annotations.WeakInterface('mapkit.traffic.TrafficLayer')
@bindings_annotations.ContainerData(
    toNative: 'TrafficLayerImpl.getNativePtr',
    toPlatform:
        '(val) => TrafficLayerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'TrafficLayer')
class TrafficLayerImpl implements TrafficLayer, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_TrafficLayer_free.cast());

  /// @nodoc
  TrafficLayerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  TrafficLayerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory TrafficLayerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(TrafficLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as TrafficLayerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _TrafficLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static TrafficLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return TrafficLayerImpl.fromNativePtr(ptr);
  }

  core.bool isTrafficVisible() {
    final result = _TrafficLayer_isTrafficVisible(ptr);
    exception.checkCallResult();
    return result;
  }

  void setTrafficVisible(core.bool on) {
    _TrafficLayer_setTrafficVisible(ptr, on);
    exception.checkCallResult();
  }

  core.bool setTrafficStyle(core.String style) {
    final result =
        _TrafficLayer_setTrafficStyle(ptr, to_native.toNativeString(style));
    exception.checkCallResult();
    return result;
  }

  core.bool setTrafficStyleWithId({
    required core.int id,
    required core.String style,
  }) {
    final result = _TrafficLayer_setTrafficStyleWithId(
        ptr, id, to_native.toNativeString(style));
    exception.checkCallResult();
    return result;
  }

  void resetTrafficStyles() {
    _TrafficLayer_resetTrafficStyles(ptr);
    exception.checkCallResult();
  }

  void addTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_addTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListenerImpl.getNativePtr(
            trafficListener));
    exception.checkCallResult();
  }

  void removeTrafficListener(
      mapkit_traffic_traffic_listener.TrafficListener trafficListener) {
    _TrafficLayer_removeTrafficListener(
        ptr,
        mapkit_traffic_traffic_listener.TrafficListenerImpl.getNativePtr(
            trafficListener));
    exception.checkCallResult();
  }
}

final _TrafficLayer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_traffic_TrafficLayer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _TrafficLayer_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_traffic_TrafficLayer_check')
    .asFunction(isLeaf: true);

final core.bool Function(ffi.Pointer<ffi.Void>) _TrafficLayer_isTrafficVisible =
    lib
        .library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'mappable_flutter_mapkit_traffic_TrafficLayer_isTrafficVisible')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _TrafficLayer_setTrafficVisible = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'mappable_flutter_mapkit_traffic_TrafficLayer_setTrafficVisible')
        .asFunction();
final core.bool Function(ffi.Pointer<ffi.Void>, native_types.NativeString)
    _TrafficLayer_setTrafficStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(
                        ffi.Pointer<ffi.Void>, native_types.NativeString)>>(
            'mappable_flutter_mapkit_traffic_TrafficLayer_setTrafficStyle')
        .asFunction();
final core.bool Function(
    ffi.Pointer<ffi.Void>,
    core.int,
    native_types
        .NativeString) _TrafficLayer_setTrafficStyleWithId = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Int,
                    native_types.NativeString)>>(
        'mappable_flutter_mapkit_traffic_TrafficLayer_setTrafficStyleWithId')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _TrafficLayer_resetTrafficStyles =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
            'mappable_flutter_mapkit_traffic_TrafficLayer_resetTrafficStyles')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)
    _TrafficLayer_addTrafficListener = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(
                        ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
            'mappable_flutter_mapkit_traffic_TrafficLayer_addTrafficListener')
        .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _TrafficLayer_removeTrafficListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_traffic_TrafficLayer_removeTrafficListener')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _TrafficLayer_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'mappable_flutter_mapkit_traffic_TrafficLayer_set_')
    .asFunction(isLeaf: true);
