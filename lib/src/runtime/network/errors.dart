import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_mapkit_lite/src/runtime/error.dart'
    as runtime_error;
import 'package:meta/meta.dart';

part 'errors.containers.dart';
part 'errors.impl.dart';

/// Server responded in unexpected way: unparsable content, wrong content
/// or unexpected HTTP code.
abstract class RemoteError implements runtime_error.Error, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// Client request is invalid (server returned the 400 'Bad Request'
/// response).
abstract class BadRequestError implements RemoteError, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// Requested object has not been found. Most likely, your link is
/// outdated or the object has been deleted.
abstract class NotFoundError implements RemoteError, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// Request entity is too large.
abstract class RequestEntityTooLargeError
    implements RemoteError, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// You are not allowed to access the requested object.
abstract class ForbiddenError implements RemoteError, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// You do not have a valid MapKit API key.
abstract class UnauthorizedError implements RemoteError, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

/// Failed to retrieve data due to network instability.
abstract class NetworkError implements runtime_error.Error, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
