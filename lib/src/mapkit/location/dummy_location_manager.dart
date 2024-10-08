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
import 'package:mappable_maps_mapkit_lite/src/mapkit/location/location.dart'
    as mapkit_location_location;
import 'package:mappable_maps_mapkit_lite/src/mapkit/location/location_manager.dart'
    as mapkit_location_location_manager;
import 'package:meta/meta.dart';

part 'dummy_location_manager.containers.dart';
part 'dummy_location_manager.impl.dart';

/// Provides the ability to set any location and notify all consumers of
/// this location.
///
/// This is a very simple location manager that is responsible for
/// passing any locations via setLocation method and notifying all
/// consumers.
///
/// \@attention The main reason why we need this class is to allow the
/// user to set this LocationManager to Guide via setLocationManager,
/// just to correct any desirable location via Guide.
abstract class DummyLocationManager
    implements
        mapkit_location_location_manager.LocationManager,
        ffi.Finalizable {
  /// Sets a location and notifies all consumers of this location.
  ///
  /// [location] Any desirable location that we would like to provide.
  void setLocation(mapkit_location_location.Location location);
}
