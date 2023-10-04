import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:task/cubit/headlines/headlines_state.dart';
import 'package:task_api/task_api.dart';


class HeadlinesCubit extends Cubit<HeadlinesState> {
  final TaskApiClient _client = TaskApiClient();
  final String? q;
  final String? from;
  final String? sortBy;
  final String? to;
  final String? domains;
  final String? country;
  final String? category;
  final String? sources;
  HeadlinesCubit({this.q, this.from, this.sortBy, this.to,this.domains,this.category,this.country,this.sources}) : super( const HeadlinesState()){
    if(country=='' && category==''&& sources=='') {
      getTeslaHeadlines();
    }
    else{
      getTopHeadlines();
    }
  }

  Future<void> getTeslaHeadlines() async {
    final result = await _client.getTeslaHeadline(q: q!,from: from!,to: to!,sortBy: sortBy!,domains:domains!);
    emit(state.copyWith(baseResponse: result));
    // print(state.baseResponse[1].urlToImage);
  }
  Future<void> getTopHeadlines() async {
    final result = await _client.getTopHeadline(category: category!,country: country!,sources: sources!);
    emit(state.copyWith(baseResponse: result));
    print(state.baseResponse[1].urlToImage);
  }
}
