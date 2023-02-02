import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:typedef_example/bloc_patterns/color_changed/color_changed.dart';

// ignore: must_be_immutable
class ColorAreaStateless extends StatelessWidget {
  ColorAreaStateless({super.key});

  final ColorChangedBloc _changedBloc = ColorChangedBloc();

  late Color _currentColor = Colors.green;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: _changedBloc.color,
          initialData: _currentColor,
          builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
            _currentColor = snapshot.data!;
            if (kDebugMode) {
              print('_currentColor ${_currentColor.value}');
            }
            return Column(
              children: <Widget>[
                //sliding switch
                SlidingSwitch(
                  value: false,
                  width: 250,
                  onChanged: (bool value) {
                    value
                        ? _changedBloc.colorChangedEventSink
                            .add(ColorChangedEvent(const Color(0xff6682c0)))
                        : _changedBloc.colorChangedEventSink
                            .add(ColorChangedEvent(const Color(0xffdc6c73)));
                  },
                  onDoubleTap: () => {},
                  onSwipe: () => {},
                  onTap: () => {},
                  textOff: "Rød",
                  textOn: "Blå",
                  colorOn: const Color(0xff6682c0),
                  colorOff: const Color(0xffdc6c73),
                  background: const Color(0xffe4e5eb),
                  buttonColor: const Color(0xfff7f5f7),
                  inactiveColor: const Color(0xff636f7b),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  color: _currentColor,
                  child: const Text(
                    'Sink/stream example\nNote the widget is stateless!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );

  void dispose() {
    _changedBloc.dispose();
  }
}
