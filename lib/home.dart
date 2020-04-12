import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/comps/CustomAppBar.dart';
import 'package:todo_ui_challenge/model/User.dart';
import 'package:todo_ui_challenge/utils/components.dart';
import 'package:todo_ui_challenge/utils/dimens.dart';
import 'package:todo_ui_challenge/utils/helpers.dart';
import 'package:animations/animations.dart' as anim;

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Dimens dimens;
  User user = User();
  List items;
  bool fullScreen = false;
  double hFactor0 = 0.42;
  double hFactor1 = 0.67;
  double hFactor2 = 0.92;

//  Animation animation;
  AnimationController animationController0,
      animationController1,
      animationController2;

  @override
  void initState() {
    super.initState();
    // animation controller => parent to each fade transition
    animationController0 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 150),
        reverseDuration: Duration(milliseconds: 100),
        value: 1);
    animationController1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 150),
        reverseDuration: Duration(milliseconds: 100),
        value: 1);
    animationController2 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 150),
        reverseDuration: Duration(milliseconds: 100),
        value: 1);
  }


  @override
  void dispose() {
    animationController0.dispose();
    animationController1.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    items = [
      itemSegmentWidget(
          context: this.context,
          heightFactor: hFactor2,
          color: darkPurpleColor,
          item: user.todoItems[2],
          overlayImage: false,
          tickerProvider: this,
          onDoubleTap: () {
            setState(() {
              fullScreen = !fullScreen;
              if (hFactor2 != 1) {
                hFactor2 = 1;
              } else {
                hFactor2 = 0.92;
              }

              if (animationController1.status == AnimationStatus.completed) {
                animationController1.reverse();
                animationController2.reverse();
              } else {
                animationController1.forward();
                animationController2.forward();
              }
            });
          }),
      itemSegmentWidget(
          context: this.context,
          heightFactor: hFactor1,
          color: purpleColor,
          item: user.todoItems[1],
          tickerProvider: this,
          onDoubleTap: () {
            setState(() {
              fullScreen = !fullScreen;
              if (hFactor1 != 1) {
                hFactor1 = 1;
              } else {
                hFactor1 = 0.67;
              }

              if (animationController0.status == AnimationStatus.completed) {
                animationController0.reverse();
                animationController2.reverse();
              } else {
                animationController0.forward();
                animationController2.forward();
              }
            });
          }),
      itemSegmentWidget(
          context: this.context,
          heightFactor: hFactor0,
          color: pinkColor,
          item: user.todoItems[0],
          tickerProvider: this,
          onDoubleTap: () {
            setState(() {
              fullScreen = !fullScreen;
              if (hFactor0 != 1) {
                hFactor0 = 1;
              } else {
                hFactor0 = 0.42;
              }

              // show / hide
              if (animationController1.status == AnimationStatus.completed) {
                animationController0.reverse();
                animationController1.reverse();
              } else {
                animationController0.forward();
                animationController1.forward();
              }
            });
          }),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 38,
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            height: dimens.height,
            color: greyColor,
            child: Stack(
              children: <Widget>[
                FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animationController0,
                    curve: Curves.fastOutSlowIn,
                  ),
                  child: items[0],
                ),
                FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animationController1,
                    curve: Curves.fastOutSlowIn,
                  ),
                  child: items[1],
                ),
                FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animationController2,
                    curve: Curves.fastOutSlowIn,
                  ),
                  child: items[2],
                ),
//                !fullScreen ? items[0] : fullScreen && (hFactor2 == 1) ? items[0] : SizedBox(),
//                !fullScreen ? items[1] : fullScreen && (hFactor1 == 1) ? items[1] : SizedBox(),
//                !fullScreen ? items[2] : fullScreen && (hFactor0 == 1) ? items[2] : SizedBox(),

                CustomAppBar(),
              ],
            ),
          ),
        ));
  }
}
