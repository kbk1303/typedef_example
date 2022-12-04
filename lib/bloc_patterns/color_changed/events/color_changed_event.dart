import 'dart:ui';

import '../../events/color_events/color_events.dart';

class ColorChangedEvent extends ColorEvent {
  final Color _newColor;

  ColorChangedEvent(this._newColor);

  Color get newColor => _newColor;
}
