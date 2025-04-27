import 'dart:async';

/// 특정 UseCase를 사용하게 되면 이벤트를 발생시키기 위한 용도의 추상클래스 (주로 리스트뷰, 디테일뷰 간 특정 객체의 상태 동기화에 사용)
///
/// 사용법
/// 1. 특정 UseCase에 해당 추상클래스를 with 키워드로 상속을 받고 [yieldData] 메소드를 call() 호출 마지막에 데이터를 넘겨 처리한다.
///
///    ```dart
///    class SampleUseCase with BaseStreamUseCase<SampleEntity> {
///      final SampleRepository _sampleRepository;
///
///      void call(SampleEntity entity) async {
///        final res = await _sampleRepository.add(entity);
///        yieldData(res);
///      }
///    }
///    ```
///
/// 2. 만약 특정 UseCase를 어떤 View에서 사용한다면 아래코드처럼 리스너와 메소드 추가
///
///    ```dart
///
///    init(){
///      _sampleUseCase.stream.listen(_onSampleEvent);
///    }
///
///    _onSampleEvent(data){
///      currentData = data;
///      setState({});
///    }
///
///    ```
///

abstract mixin class BaseStreamUseCase<R> {
  final _streamController = StreamController<R>.broadcast();

  Stream<R> get stream => _streamController.stream;

  void dispose() => _streamController.close();

  void yieldData(R data) => _streamController.add(data);
}