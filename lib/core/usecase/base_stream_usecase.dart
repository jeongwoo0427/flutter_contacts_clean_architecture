import 'dart:async';

abstract mixin class BaseStreamUseCase<R> {
  final _streamController = StreamController<R>.broadcast();

  Stream<R> get stream => _streamController.stream;

  void dispose() => _streamController.close();

  void yieldData(R data) => _streamController.add(data);
}