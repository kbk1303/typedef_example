import 'package:flutter/material.dart';
import 'package:typedef_example/widgets/widgets.dart';

typedef OnColorChanged = void Function(Color c, BuildContext context);

// ignore: must_be_immutable
class ColorArea extends StatefulWidget {
  const ColorArea({super.key});

  @override
  State<ColorArea> createState() => _ColorAreaState();
}

class _ColorAreaState extends State<ColorArea> {
  // ignore: prefer_final_fields
  late Color _color = Colors.black;

  void setColorOnChanged(Color c, BuildContext context) {
    setState(() {
      _color = c;
    });
  }

  @override
  Widget build(BuildContext context) => Wrap(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
          ),
          ToggleSliderButton(colorChanged: setColorOnChanged),
          Container(
            margin: const EdgeInsets.all(20),
            width: 200,
            height: 200,
            color: _color,
            child: const Text(
              'typedef example',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
}
