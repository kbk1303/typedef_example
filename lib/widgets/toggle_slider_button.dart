import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:typedef_example/widgets/color_area.dart';

// ignore: must_be_immutable
class ToggleSliderButton extends StatelessWidget {
  ToggleSliderButton({super.key, required this.colorChanged});

  ToggleSliderButton.withoutCallback({
    super.key,
  });

  OnColorChanged? colorChanged;

  @override
  Widget build(BuildContext context) => Wrap(
        children: <Widget>[
          SlidingSwitch(
            value: false,
            width: 250,
            onChanged: (bool value) {
              if (colorChanged != null) {
                value
                    ? colorChanged!(const Color(0xff6682c0), context)
                    : colorChanged!(const Color(0xffdc6c73), context);
              }
            },
            height: 55,
            animationDuration: const Duration(milliseconds: 400),
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},
            textOff: "Rød",
            textOn: "Blå",
            colorOn: const Color(0xff6682c0),
            colorOff: const Color(0xffdc6c73),
            background: const Color(0xffe4e5eb),
            buttonColor: const Color(0xfff7f5f7),
            inactiveColor: const Color(0xff636f7b),
          ),
        ],
      );
}
