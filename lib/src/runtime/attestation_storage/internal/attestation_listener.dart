import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:mappable_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/to_native.dart'
    as to_native;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:meta/meta.dart';

part 'attestation_listener.containers.dart';
part 'attestation_listener.impl.dart';

/// @nodoc
abstract class AttestationListener implements ffi.Finalizable {
  /// Attestation was received.
  void onAttestationReceived(typed_data.ByteBuffer response);

  /// An error occurred during Attestation request.
  void onAttestationFailed(core.String message);
}
