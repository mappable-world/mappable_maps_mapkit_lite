import 'dart:ffi' as ffi;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/library.dart'
    as lib;

import 'dart:core' as core;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:mappable_maps_mapkit_lite/src/bindings/common/exception.dart'
    as exception;
import 'package:meta/meta.dart';

part 'callback.impl.dart';

abstract final class Callback {
  factory Callback({required void Function() onTaskFinished}) {
    return CallbackImpl(
      onTaskFinished: onTaskFinished,
    );
  }

  /// The callback is invoked when the task is completed successfully.
  void onTaskFinished();
}
