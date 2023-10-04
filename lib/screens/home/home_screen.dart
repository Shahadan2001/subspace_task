import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/extension/widget_extension.dart';
import 'package:task/screens/articles/articles.dart';
import 'package:task/utils/Constants.dart';
import 'package:task/utils/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String yesDate() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Subtract one day to get yesterday's date
    DateTime yesterdayDate = currentDate.subtract(Duration(days: 1));

    // Format the date if needed
    String formattedDate = "${yesterdayDate.year}-${yesterdayDate.month}-${yesterdayDate.day}";

    print("Yesterday's date: $formattedDate");
    return formattedDate;
  }
  String lastMonth() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate the last month's date
    DateTime lastMonthDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);

    // Format the date if needed
    String formattedDate = "${lastMonthDate.year}-${lastMonthDate.month}-${lastMonthDate.day}";

    print("Last month's date: $formattedDate");
    return formattedDate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News'),
          centerTitle: true,
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff79aaa6)),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
            ),
              onPressed: ()=>context.pushNamed(RouterConstants.articleScreen,extra:  ArticleArguments(q: 'tesla',from: lastMonth(),sortBy: 'publishedAt')),
              child: const Text('All articles about Tesla from the last month, sorted by recent first',textAlign: TextAlign.center,style:Constants.homeTextStyle,)),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff79aaa6)),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              onPressed: ()=>context.pushNamed(RouterConstants.articleScreen,extra:  ArticleArguments(q: 'apple',from: yesDate(),to: yesDate(),sortBy: 'popularity')),
              child: const Text('All articles mentioning Apple from yesterday, sorted by popular publishers first',textAlign: TextAlign.center,style:Constants.homeTextStyle)),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff79aaa6)),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              onPressed: ()=>context.pushNamed(RouterConstants.articleScreen,extra: const ArticleArguments(country:'us',category:'business')),
              child: const Text('Top business headlines in the US right now',textAlign: TextAlign.center,style:Constants.homeTextStyle)),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(2),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff79aaa6)),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              onPressed: ()=>context.pushNamed(RouterConstants.articleScreen,extra: const ArticleArguments(sources: 'techcrunch')),
              child: const Text('Top headlines from TechCrunch right now',textAlign: TextAlign.center,style:Constants.homeTextStyle)),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff79aaa6)),
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              onPressed: ()=>context.pushNamed(RouterConstants.articleScreen,extra: const ArticleArguments(domains: 'wsj.com')),
              child: const Text('All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',textAlign: TextAlign.center,style:Constants.homeTextStyle)),
        ],
      ).wrapWithCenter().paddingWithSymmetry(horizontal: 16),
    );
  }
}
class ArticleArguments{
  final String? q;
  final String? from;
  final String? sortBy;
  final String? to;
  final String? domains;
  final String? country;
  final String? category;
  final String? sources;
  const ArticleArguments({this.q='', this.from='', this.sortBy='', this.to='',this.domains='',this.category='',this.country='',this.sources=''});
}