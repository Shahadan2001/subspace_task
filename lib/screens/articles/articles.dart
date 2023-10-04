import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubit/headlines/headlines_cubit.dart';
import 'package:task/cubit/headlines/headlines_state.dart';
import 'package:task/custom_widgets/news_card.dart';
import 'package:task/extension/widget_extension.dart';
import 'package:task/screens/home/home_screen.dart';
import 'package:task/utils/Constants.dart';

class AllArticles extends StatelessWidget {
  // final String? q;
  // final String? from;
  // final String? sortBy;
  // final String? to;
  // final String? domains;
  // final String? country;
  // final String? category;
  // final String? sources;
  final ArticleArguments articleArguments;
  const AllArticles({super.key,required this.articleArguments});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeadlinesCubit(q: articleArguments.q!,from: articleArguments.from!,sortBy: articleArguments.sortBy!,to: articleArguments.to!,domains:articleArguments.domains!,sources: articleArguments.sources!,country: articleArguments.country!,category: articleArguments.category!),
      child: BlocBuilder<HeadlinesCubit, HeadlinesState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: const Text('News'),
                  centerTitle: true,
                  ),
              body:state.baseResponse.isNotEmpty ? ListView.builder(
                          shrinkWrap: true,
                           itemCount: state.baseResponse.length,
                           itemBuilder: (context, index) =>
                            NewsCard(
                             imageUrl:state.baseResponse[index].urlToImage  ?? '',
                             title: state.baseResponse[index].title ?? '',
                              author: state.baseResponse[index].author?? '',
                              url: state.baseResponse[index].url?? '',
                              publishedAt: state.baseResponse[index].publishedAt??'',
                           ),
                         ):CircularProgressIndicator().wrapWithCenter(),
          );
        },
      ),
    );
  }
}
