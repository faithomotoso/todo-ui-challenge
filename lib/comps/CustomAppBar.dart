import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/model/User.dart';
import 'package:todo_ui_challenge/utils/dimens.dart';
import 'package:todo_ui_challenge/utils/helpers.dart';

class CustomAppBar extends StatefulWidget{

  @override
  State createState() {
    return _CustomAppBarState();
  }
}

class _CustomAppBarState extends State<CustomAppBar>{
  User user = User();
  Dimens dimens;
  double bottomLeftRadius = 70;
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Container(
      width: dimens.width,
      height: dimens.height * 0.16,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(bottomLeftRadius))
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: appBarIcon(photo: user.photo, text: "You", isSelected: selectedIndex == 0 ? true : false),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                 selectedIndex = 1;
                });
              },
              child: appBarIcon(icon: Icons.trending_up, text: "Trending", isSelected: selectedIndex == 1 ? true : false),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = 2;
                });
              },
              child: appBarIcon(icon: Icons.favorite_border, text: "Health", isSelected: selectedIndex == 2 ? true : false),
            )
          ],
        ),
      ),
    );
  }

  Widget appBarIcon({
    String photo,
    IconData icon,
    String text,
    bool isSelected = false
  }){
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          photo != null ? Badge(
            badgeContent: Text(user.notificationCount.toString(), style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500
            ),),
            badgeColor: greyColor,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? Colors.red : Colors.transparent, width: 1.5)
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(photo),
                radius: 16,
              ),
            ),
          ) : Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? Colors.red : Colors.grey, width: 1.5)
            ),
            height: 50,
            width: 50,
            child: Center(
              child: Icon(icon),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            text.toUpperCase(),
            style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}