import 'package:task_api/task_api.dart';
class HeadlinesState {
  final List<BaseResponse> baseResponse;

  @override
  List<Object> get props => [baseResponse];

  const HeadlinesState({this.baseResponse = const [],});
  HeadlinesState copyWith({
    List<BaseResponse>? baseResponse
  }) => HeadlinesState(baseResponse: baseResponse ?? this.baseResponse,);
}

