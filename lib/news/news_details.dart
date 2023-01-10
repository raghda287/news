import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/my_theme.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news details';
  @override
  Widget build(BuildContext context) {
    Articles args = ModalRoute.of(context)?.settings.arguments as Articles;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: MyTheme.primaryLight),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        elevation: 0,
        centerTitle: true,
        title: const Text(''),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(

                    borderRadius: BorderRadius.circular(18),
                    child: CachedNetworkImage(
                      imageUrl: args.urlToImage ?? '',
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 200,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(
                        color: MyTheme.primaryLight,
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    args.title ?? '',
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(args.content ?? ''),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(args.publishedAt ?? '', textAlign: TextAlign.end),
                  const SizedBox(
                    height: 12,
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(args.description ?? ""),
                          const SizedBox(
                            height: 22,
                          ),

                          InkWell(
                            onTap: (){
                              _launchUrl(Uri.parse(args.url ??""));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('View Full Articles'),
                                Icon(Icons.play_arrow_sharp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
