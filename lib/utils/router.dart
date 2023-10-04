import 'package:go_router/go_router.dart';
import 'package:task/screens/articles/articles.dart';
import 'package:task/screens/home/home_screen.dart';

final GoRouter taskRouter = GoRouter(
  initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: RouterConstants.homeScreen,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path:'articles',
            name: RouterConstants.articleScreen,
            builder: (context, state) {
              print(state.fullPath.toString());
              print('----');
              return AllArticles(articleArguments: state.extra as ArticleArguments,);},
          )
        ]
      ),
    ]
);

class RouterConstants {
  static const homeScreen='home';
  static const articleScreen = 'articles';
}