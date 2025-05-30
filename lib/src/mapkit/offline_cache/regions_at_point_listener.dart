import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:mappable_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:meta/meta.dart';

part 'regions_at_point_listener.impl.dart';

abstract final class RegionsAtPointListener {
  factory RegionsAtPointListener(
      {required void Function(core.List<core.int> regions) onRegions,
      required void Function(runtime_error.Error error) onError}) {
    return RegionsAtPointListenerImpl(
      onRegions: onRegions,
      onError: onError,
    );
  }

  void onRegions(core.List<core.int> regions);
  void onError(runtime_error.Error error);
}
