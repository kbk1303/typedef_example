import 'dart:async';
import 'dart:ui';

import 'package:typedef_example/bloc_patterns/color_changed/color_changed.dart';

import '../../events/color_events/color_events.dart';

class ColorChangedBloc {
  //stream handling
  final _colorChangedStateController = StreamController<Color>();

  StreamSink<Color> get _currentColor => _colorChangedStateController.sink;

  Stream<Color> get color => _colorChangedStateController.stream;

  //sink handling
  final _colorChangedEventController = StreamController<ColorEvent>();

  Sink<ColorEvent> get colorChangedEventSink =>
      _colorChangedEventController.sink;

  ColorChangedBloc() {
    _colorChangedEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ColorEvent event) {
    if (event is ColorChangedEvent) {
      _currentColor.add(event.newColor);
    }
  }

  void dispose() {
    _colorChangedEventController.close();
    _colorChangedStateController.close();
  }
}
