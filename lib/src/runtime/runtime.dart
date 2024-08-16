import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;

part 'runtime.impl.dart';

/// @nodoc
class Runtime {
  Runtime._();

  static core.String version() {
    return _version();
  }

  static void setPreinitializationOptions(
      core.Map<core.String, core.String> runtimeOptions) {
    _setPreinitializationOptions(
      runtimeOptions,
    );
  }
}