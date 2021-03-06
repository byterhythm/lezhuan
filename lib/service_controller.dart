import 'dart:async';

class ServiceController<T> extends Stream<T> implements EventSink<T> {
  ServiceController() {
    _controller = StreamController<T>.broadcast();
  }

  StreamController<T> _controller;

  @override
  StreamSubscription<T> listen(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError: false}) {
    return _controller.stream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  @override
  void add(T event) {
    _controller.add(event);
  }

  @override
  void addError(Object error, [StackTrace stackTrace]) {
    _controller.addError(error, stackTrace);
  }

  @override
  void close() {
    _controller.close();
  }

  void clearCache() {}
}
