import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:mappable_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:meta/meta.dart';

part 'surface.containers.dart';
part 'surface.impl.dart';

/// Here is android only implementation
abstract class Surface implements ffi.Finalizable {
  /// Anchor shifts the region of the frame that will be rendered on the
  /// surface. Anchor coordinates are within \[0; 1\] bounds. Position of
  /// frame’s focusPoint will match specified anchorPoint in the surface:
  /// - (0, 0) - left bottom corner of the surface; - (1, 1) - right top
  /// corner of the surface; Default value is (0.5, 0.5)
  math.Point<core.double> get anchorPoint;
  set anchorPoint(math.Point<core.double> val);
}
