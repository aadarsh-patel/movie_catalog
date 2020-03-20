import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_catalog/common/theme.dart';
import 'package:movie_catalog/model/data.dart';
import 'package:movie_catalog/screens/detail.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _BrowseScreenState extends State<BrowseScreen> {
  var currentPage = movies.length - 1.0;

  @override
  Widget build(BuildContext context) {
    Size sizeData = MediaQuery.of(context).size;
    PageController pageController =
        PageController(initialPage: movies.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    return Container(
      height: sizeData.height,
      width: sizeData.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: <Widget>[
          CardScrollWidget(currentPage),
          Positioned(
            left: 30,
            top: 460,
            child: Container(
              width: sizeData.width * 0.75,
              child: Text(
                movies[currentPage.toInt()].title,
                key: ValueKey('movie_name'),
                style: titleStyle,
              ),
            ),
          ),
          // This is a glorified gesture.
          Positioned.fill(
            child: PageView.builder(
              key: ValueKey('pageview'),
              itemCount: movies.length,
              controller: pageController,
              reverse: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(30, 40, 90, 200),
                  child: Tooltip(
                    message: 'movie_poster',
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (ctx, anim1, anim2) =>
                              DetailScreen(index),
                          transitionsBuilder: (ctx, anim1, anim2, child) =>
                              FadeTransition(opacity: anim1, child: child),
                          transitionDuration: Duration(milliseconds: 800),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  final currentPage;
  final padding = 20.0;
  final verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < movies.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Hero(
                    tag: movies[i].id,
                    child: Image.asset(movies[i].image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
