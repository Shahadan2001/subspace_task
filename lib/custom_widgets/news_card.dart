import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/extension/widget_extension.dart';
import 'package:task/utils/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String ?imageUrl;
  final String ?author;
  final String ?url;
  final String? publishedAt;
  const NewsCard({
    super.key,
     this.title,
     this.imageUrl,
     this.author,
     this.url,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>launchURL(url!),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black12)
        ),
        margin: const EdgeInsets.all(16),
        elevation: 1,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Text(publishedAt!)
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10),
                  child:Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl!),
                    errorBuilder: (context, error, stackTrace) => const Image(image: AssetImage('assets/images/defaultImage.jpg')),
                  ),
              ).paddingWithOnly(top: 10),
              Text('${title??''}\n -- ${author ?? ''}',style: Constants.titleTextStyle,).paddingWithOnly(top: 10),
          ]
        ).paddingWithAll(value: 10),
      ),
    );
  }

  Future<void>launchURL(String _url) async {
    var url = Uri.parse(_url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
