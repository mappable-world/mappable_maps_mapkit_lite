import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_mapkit_lite/src/runtime/local_error.dart'
    as runtime_local_error;
import 'package:meta/meta.dart';

part 'errors.containers.dart';
part 'errors.impl.dart';

/// Cache path doesn't exist or there no read permissions.
abstract class CachePathUnavailable
    implements runtime_local_error.LocalError, ffi.Finalizable {
  core.bool isValid();
}
