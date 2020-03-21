import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/comps/CustomAppBar.dart';
import 'package:todo_ui_challenge/model/User.dart';
import 'package:todo_ui_challenge/utils/components.dart';
import 'package:todo_ui_challenge/utils/dimens.dart';
import 'package:todo_ui_challenge/utils/helpers.dart';
import 'package:animations/animations.dart' as anim;

class Home extends StatefulWidget{

  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  Dimens dimens;
  User user = User();
  double factor = 0.3;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: Colors.black, size: 38,),backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          height: dimens.height,
          color: greyColor,
          child: Stack(
            children: <Widget>[
              itemSegmentWidget(context: context, heightFactor: 0.92,
                  color: darkPurpleColor,
                  item: user.todoItems[2]
              ),
              itemSegmentWidget(context: context, heightFactor: 0.67,
              color: purpleColor,
                item: user.todoItems[1]
              ),
              itemSegmentWidget(context: context, heightFactor: 0.42,
                color: pinkColor,
                item: user.todoItems[0],
              ),
            CustomAppBar()
            ],
          ),
      ),
    ));

  }
}