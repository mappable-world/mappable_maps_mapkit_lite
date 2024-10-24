part of 'data_source_layer.dart';

@bindings_annotations.WeakInterface('mapkit.layers.DataSourceLayer')
@bindings_annotations.ContainerData(
    toNative: 'DataSourceLayerImpl.getNativePtr',
    toPlatform:
        '(val) => DataSourceLayerImpl.fromOptionalPtr(val.cast<ffi.Pointer<ffi.Void>>().value)',
    platformType: 'DataSourceLayer')
class DataSourceLayerImpl implements DataSourceLayer, ffi.Finalizable {
  @protected
  final ffi.Pointer<ffi.Void> ptr;
  static final _finalizer = ffi.NativeFinalizer(_DataSourceLayer_free.cast());

  /// @nodoc
  DataSourceLayerImpl.fromExternalPtr(this.ptr);

  /// @nodoc
  @internal
  DataSourceLayerImpl.fromNativePtrImpl(this.ptr) {
    _finalizer.attach(this, ptr);
  }

  /// @nodoc
  @internal
  factory DataSourceLayerImpl.fromNativePtr(ffi.Pointer<ffi.Void> ptr) =>
      weak_interface_wrapper.createFromNative(ptr);

  @internal

  /// @nodoc
  static ffi.Pointer<ffi.Void> getNativePtr(DataSourceLayer? obj) {
    if (obj == null) return ffi.nullptr;
    return (obj as DataSourceLayerImpl).ptr;
  }

  @core.override
  core.bool isValid() {
    return _DataSourceLayer_check(ptr);
  }

  @internal

  /// @nodoc
  static DataSourceLayer? fromOptionalPtr(ffi.Pointer<ffi.Void> ptr) {
    if (ptr == ffi.nullptr) return null;
    return DataSourceLayerImpl.fromNativePtr(ptr);
  }

  @core.override
  core.bool get active {
    final result = _DataSourceLayer_get_active(ptr);
    exception.checkCallResult();
    return result;
  }

  @core.override
  set active(core.bool val) {
    _DataSourceLayer_set_active(ptr, val);
    exception.checkCallResult();
  }

  void clear() {
    _DataSourceLayer_clear(ptr);
    exception.checkCallResult();
  }

  core.bool setStyle({
    required core.int id,
    required core.String style,
  }) {
    final result =
        _DataSourceLayer_setStyle(ptr, id, to_native.toNativeString(style));
    exception.checkCallResult();
    return result;
  }

  void resetStyles() {
    _DataSourceLayer_resetStyles(ptr);
    exception.checkCallResult();
  }

  void setLayerLoadedListener(
      mapkit_layers_layer_loaded_listener.LayerLoadedListener?
          layerLoadedListener) {
    _DataSourceLayer_setLayerLoadedListener(
        ptr,
        mapkit_layers_layer_loaded_listener.LayerLoadedListenerImpl
            .getNativePtr(layerLoadedListener));
    exception.checkCallResult();
  }

  void remove() {
    _DataSourceLayer_remove(ptr);
    exception.checkCallResult();
  }

  void setDataSourceListener(
      mapkit_layers_data_source.DataSourceListener? dataSourceListener) {
    _DataSourceLayer_setDataSourceListener(
        ptr,
        mapkit_layers_data_source.DataSourceListenerImpl.getNativePtr(
            dataSourceListener));
    exception.checkCallResult();
  }
}

final _DataSourceLayer_free = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_free');
final core.bool Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_check = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_check')
    .asFunction(isLeaf: true);

final core.bool Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_get_active =
    lib.library
        .lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Pointer<ffi.Void>)>>(
            'mappable_flutter_mapkit_layers_DataSourceLayer_get_active')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.bool)
    _DataSourceLayer_set_active = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Bool)>>(
            'mappable_flutter_mapkit_layers_DataSourceLayer_set_active')
        .asFunction();

final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_clear = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_clear')
    .asFunction();
final core.bool Function(
        ffi.Pointer<ffi.Void>, core.int, native_types.NativeString)
    _DataSourceLayer_setStyle = lib.library
        .lookup<
                ffi.NativeFunction<
                    ffi.Bool Function(ffi.Pointer<ffi.Void>, ffi.Int,
                        native_types.NativeString)>>(
            'mappable_flutter_mapkit_layers_DataSourceLayer_setStyle')
        .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_resetStyles = lib
    .library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_resetStyles')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _DataSourceLayer_setLayerLoadedListener = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_setLayerLoadedListener')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>) _DataSourceLayer_remove = lib.library
    .lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_remove')
    .asFunction();
final void Function(
    ffi.Pointer<ffi.Void>,
    ffi
        .Pointer<ffi.Void>) _DataSourceLayer_setDataSourceListener = lib.library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(
                    ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_setDataSourceListener')
    .asFunction();
final void Function(ffi.Pointer<ffi.Void>, core.int) _DataSourceLayer_set = lib
    .library
    .lookup<
            ffi.NativeFunction<
                ffi.Void Function(ffi.Pointer<ffi.Void>, ffi.Int64)>>(
        'mappable_flutter_mapkit_layers_DataSourceLayer_set_')
    .asFunction(isLeaf: true);
