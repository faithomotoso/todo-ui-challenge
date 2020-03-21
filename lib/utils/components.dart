import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/model/User.dart';
import 'package:todo_ui_challenge/utils/dimens.dart';
import 'package:todo_ui_challenge/utils/helpers.dart';

final double bottomLeftRadius = 80;

Widget circleAvatar({String assetLocation}) {
  return Container(
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3)),
    child: CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(assetLocation),
    ),
  );
}

Widget doubleCircleAvatar({List<String> assetsLocations}) {
  return Container(
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 20,
          child: circleAvatar(assetLocation: assetsLocations.last),
        ),
        Positioned(
          left: 0,
          child: circleAvatar(assetLocation: assetsLocations.first),
        )
      ],
    ),
  );
}

Widget itemSegmentWidget({
  @required BuildContext context,
  @required double heightFactor,
  Color color,
  TodoItem item,
}) {
  double fullHeight = MediaQuery.of(context).size.height;
  double fullWidth = MediaQuery.of(context).size.width;

  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeIn,
    decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(bottomLeftRadius))),
    height: fullHeight * heightFactor,
    width: fullWidth,
    padding: EdgeInsets.only(left: 10),
    child: Stack(
      children: <Widget>[
        item.icon != null || item.bgText != null || item.iconLoc != null
            ? Positioned(
                right: 20,
//          top: fullHeight * heightFactor * 0.55,
                bottom: 22,
                child: Container(
                  height: 100,
                  child: item.icon != null
                      ? Icon(
                          item.icon,
                          size: 80,
                          color: Colors.black.withOpacity(0.1),
                        )
                      : item.iconLoc != null
                          ? ImageIcon(
                              AssetImage(item.iconLoc),
                              color: Colors.black.withOpacity(0.1),
                              size: 80,
                            )
                          : Text(
                              item.bgText,
                              style: TextStyle(
                                  fontSize: 78,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.1)),
                            ),
                ))
            : SizedBox(),
        Positioned(
//                bottom: fullHeight * 0.05,
            bottom: 30,
            child: Container(
              width: fullWidth,
              height: fullHeight * 0.2,
              child: Align(
                child: Container(
                  width: fullWidth * 0.9,
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.getTime(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: fullWidth * 0.66,
                        child: Text(
                          item.note,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        height: fullHeight * 0.055,
                        child: Stack(
                          children: <Widget>[
                            doubleCircleAvatar(assetsLocations: [
                              item.members[0].photoLoc,
                              item.members[1].photoLoc
                            ]),
                            Positioned(
                              left: 64,
                              child: Container(
                                height: 36,
                                alignment: Alignment.center,
                                child: Text(
                                    "Join ${item.members[0].name}, ${item.members[1].name} and ${item.members.length - 2} others",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color:
                                        Colors.white.withOpacity(0.6))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    ),
  );
}
