class ValueEmitter<T> {
  T t;
  ValueEmitter(this.t);

  T emitValue() {
    return t;
  }

  void setValue(T value) {
    t = value;
  }
}
