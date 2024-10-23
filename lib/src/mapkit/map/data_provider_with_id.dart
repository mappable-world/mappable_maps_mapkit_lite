import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;

part 'data_provider_with_id.impl.dart';

/// Provides any string data.
abstract class DataProviderWithId {
  /// Use the same id for the identical data, to prevent repeated loading
  /// of the same data into RAM and VRAM. Called in any thread.
  core.Future<core.String> providerId();

  /// Return string data. Called in a separate thread.
  core.Future<core.String> load();
}