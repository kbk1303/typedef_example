import 'dart:async';

import 'package:typedef_example/bloc_patterns/generic_value_changed/value_emitter/value_emitter.dart';

class ValueChangedBloc<E extends ValueEmitter> {
  late StreamSink<E> _valueChangedState;
  final _valueChangedStateController = StreamController<E>();
  final _valueChangedEventController = StreamController<E>();
  Sink<E> get valueChanged => _valueChangedEventController.sink;
  Stream<E> get valueChangedEvent => _valueChangedStateController.stream;
  final E event;
  ValueChangedBloc(this.event) {
    _valueChangedState = _valueChangedStateController.sink;

    _valueChangedEventController.stream.listen((event) {
      _valueChangedState.add(event);
    });
  }

  void dispose() {
    _valueChangedStateController.close();
  }
}
