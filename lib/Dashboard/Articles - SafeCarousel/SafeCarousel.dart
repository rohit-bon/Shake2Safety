import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake2safety/Dashboard/Articles%20-%20SafeCarousel/ArticleDesc.dart';
import 'package:shake2safety/Dashboard/Articles%20-%20SafeCarousel/SadeWebView.dart';
import 'package:shake2safety/constants.dart';

class SafeCarousel extends StatelessWidget {
  const SafeCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: List.generate(
            imageSliders.length,
            (index) => Hero(
                  tag: articleTitle[index],
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        // WebviewScaffold(
                        //   url: "https://www.google.com",
                        //   appBar: new AppBar(
                        //     title: new Text("Widget webview"),
                        //   ),
                        // ),
                        if (index == 0) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  index: index,
                                  title:
                                      "Indian women inspiring the country",
                                  url:
                                      "https://www.safetydetectives.com/blog/womens-safety-research/"));
                        } else if (index == 1) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  index: index,
                                  title: "We have to end Violance",
                                  url:
                                      "https://www.legalserviceindia.com/legal/article-7599-safety-of-women-in-india.html"));
                        } else if (index == 2) {
                          navigateToRoute(context, ArticleDesc(index: index));
                        } else {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  index: index,
                                  title: "You are strong",
                                  url:
                                      "https://www.competitionreview.in/blogs/2022/09/15/womens-safety-2"));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(imageSliders[index]),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8),
                              child: Text(
                                articleTitle[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  void navigateToRoute(
    BuildContext context,
    Widget route,
  ) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => route,
      ),
    );
  }
}
