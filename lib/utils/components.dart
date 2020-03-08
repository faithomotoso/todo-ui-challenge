import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/model/User.dart';
import 'package:todo_ui_challenge/utils/dimens.dart';
import 'package:todo_ui_challenge/utils/helpers.dart';

final double bottomLeftRadius = 70;

Widget circleAvatar({String assetLocation}) {
  return CircleAvatar(
    backgroundColor: Colors.white,
    backgroundImage: AssetImage(assetLocation),
  );
}

Widget doubleCircleAvatar({List<String> assetsLocation}) {
  return Container(
    child: Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          child: circleAvatar(assetLocation: assetsLocation.last),
        ),
        Positioned(
          left: 0,
          child: circleAvatar(assetLocation: assetsLocation.first),
        )
      ],
    ),
  );
}

Widget itemSegmentWidget({
  @required BuildContext context,
  @required double heightFactor,
  Color color,
  IconData bgIcon,
  String bgText,
  TodoItem item,
}) {
  double fullHeight = MediaQuery.of(context).size.height;
  double fullWidth = MediaQuery.of(context).size.width;

  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeIn,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(bottomLeftRadius))),
    height: fullHeight * heightFactor,
    width: fullWidth,
    alignment: Alignment.center,
    child: FractionallySizedBox(
      widthFactor: 0.8,
      child: Stack(
        children: <Widget>[
          bgIcon != null || bgText != null
              ? Positioned(
            right: 20,
            child: bgIcon != null
                ? Icon(
              bgIcon,
              size: 40,
              color: Colors.white.withOpacity(0.4),
            )
                : Text(
              bgText,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.4)),
            ),
          )
              : SizedBox(),
          Positioned(
//                bottom: fullHeight * 0.05,
              bottom: 900,
              child: Container(
                height: fullHeight * 0.2,
                child: Column(
                  children: <Widget>[
                    Text(
                      item.getTime(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.note,
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}


//Widget customAppBar({@required User user, @required Dimens dimens}){
//  int selectedIndex = 0;
//
//  Widget appBarIcon({
//    String photo,
//    IconData icon,
//    String text,
//  }){
//    return Container(
//      padding: EdgeInsets.all(8),
//      margin: EdgeInsets.symmetric(horizontal: 16),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          photo != null ? Badge(
//            badgeContent: Text(user.notificationCount.toString(), style: TextStyle(
//              color: Colors.white, fontWeight: FontWeight.w500
//            ),),
//            badgeColor: greyColor,
//            child: Container(
//              height: 50,
//              width: 50,
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                  border: Border.all(color: Colors.transparent, width: 1.5)
//              ),
//              child: CircleAvatar(
//                backgroundImage: AssetImage(photo),
//                radius: 16,
//              ),
//            ),
//          ) : Container(
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              border: Border.all(color: Colors.grey, width: 1.5)
//            ),
//            height: 50,
//            width: 50,
//            child: Center(
//              child: Icon(icon),
//            ),
//          ),
//          SizedBox(
//            height: 6,
//          ),
//          Text(
//            text.toUpperCase(),
//            style: TextStyle(
//              fontSize: 12,
//              color: Colors.grey,
//              fontWeight: FontWeight.w500
//            ),
//          )
//        ],
//      ),
//    );
//  };
//
//  return Container(
//    width: dimens.width,
//    height: dimens.height * 0.16,
//    padding: EdgeInsets.symmetric(horizontal: 30),
//    decoration: BoxDecoration(
//        color: Colors.white,
//        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(bottomLeftRadius))
//    ),
//    child: Center(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          appBarIcon(photo: user.photo, text: "You",),
//          appBarIcon(icon: Icons.trending_up, text: "Trending", ),
//          appBarIcon(icon: Icons.favorite_border, text: "Health",),
//        ],
//      ),
//    ),
//  );
//}
