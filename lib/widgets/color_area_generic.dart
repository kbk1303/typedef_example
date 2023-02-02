import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:typedef_example/bloc_patterns/generic_value_changed/bloc/event/value_changed_event.dart';
import 'package:typedef_example/bloc_patterns/generic_value_changed/bloc/value_changed_bloc.dart';

class ColorAreaGeneric extends StatefulWidget {
  const ColorAreaGeneric({super.key});

  @override
  State<ColorAreaGeneric> createState() => _ColorAreaGenericState();
}

class _ColorAreaGenericState extends State<ColorAreaGeneric> {
  final ValueChangedBloc<ValueChangedEvent<Color>> bloc =
      ValueChangedBloc(ValueChangedEvent(Colors.orange));
  //var color = bloc.initialValue().emitValue();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: StreamBuilder(
        stream: bloc.valueChangedEvent,
        initialData: bloc.event,
        builder:
            (BuildContext context, AsyncSnapshot<ValueChangedEvent> snapshot) {
          //color = snapshot.data?.emitValue();
          if (kDebugMode) {
            print('_currentColor ${snapshot.data?.emitValue().value}');
          }
          return Column(
            children: <Widget>[
              //sliding switch
              SlidingSwitch(
                value: false,
                width: 250,
                onChanged: (bool value) {
                  value
                      ? bloc.valueChanged
                          .add(ValueChangedEvent(const Color(0xff6682c0)))
                      : bloc.valueChanged
                          .add(ValueChangedEvent(const Color(0xffdc6c73)));
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
                color: snapshot.data?.emitValue(),
                child: const Text(
                  'Sink/stream example\nGeneric Bloc pattern!',
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
  }
}
