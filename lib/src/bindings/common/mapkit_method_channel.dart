import 'package:flutter/services.dart';

class MapkitMethodChannel extends MethodChannel {
  const MapkitMethodChannel(String name)
      : super('flutter_mappable_mapkit/$name');
}
