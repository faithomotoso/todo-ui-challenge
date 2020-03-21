
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User{
  String _photo = "assets/avatars/avatar0.jpg";
  int _notificationCount = 12;
  List<Member> _members = [
    Member(
      name: "Joe",
      photoLoc: "assets/avatars/4.jfif"
    )
  ];
  List<TodoItem> _todoItems = [
    TodoItem(
      time: "5:30 PM",
      day: "Today",
      note: "Yoga and Meditation for Beginners",
      iconLoc: "assets/icons/electrocardiogram.png",
      members: [
        Member(name: "Katie", photoLoc: "assets/avatars/avatar2.jpg"),
        Member(name: "Mike", photoLoc: "assets/avatars/avatar3.png"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar4.jfif"),
        Member(name: "Katie", photoLoc: "assets/avatars/avatar12.jfif"),
        Member(name: "Mike", photoLoc: "assets/avatars/avatar10.jpg"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar11.jpg"),
        Member(name: "Katie", photoLoc: "assets/avatars/avatar9.jpg"),
        Member(name: "Mike", photoLoc: "assets/avatars/avatar3.png"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
        Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif")
      ]
    ),
    TodoItem(
        time: "5:30 PM",
        day: "Tuesday",
        note: "Practice French, English And Chinese",
        iconLoc: "assets/icons/geography.png",
        members: [
          Member(name: "Sam", photoLoc: "assets/avatars/avatar5.jfif"),
          Member(name: "Murdock", photoLoc: "assets/avatars/avatar6.jfif"),
          Member(name: "Lisa", photoLoc: "assets/avatars/avatar7.jfif"),
          Member(name: "Katie", photoLoc: "assets/avatars/avatar12.jfif"),
          Member(name: "Mike", photoLoc: "assets/avatars/avatar10.jpg"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar11.jpg"),
          Member(name: "Katie", photoLoc: "assets/avatars/avatar9.jpg"),
          Member(name: "Mike", photoLoc: "assets/avatars/avatar3.png"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif")
        ]
    ),
    TodoItem(
        time: "6:00 PM",
        day: "Friday",
        note: "Adobe XD Live Event in Europe",
        bgText: "Xd",
        members: [
          Member(name: "Adam", photoLoc: "assets/avatars/avatar8.jpg"),
          Member(name: "Berry", photoLoc: "assets/avatars/avatar9.jpg"),
          Member(name: "Carie", photoLoc: "assets/avatars/avatar10.jpg"),
          Member(name: "Katie", photoLoc: "assets/avatars/avatar12.jfif"),
          Member(name: "Mike", photoLoc: "assets/avatars/avatar10.jpg"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar11.jpg"),
          Member(name: "Katie", photoLoc: "assets/avatars/avatar9.jpg"),
          Member(name: "Mike", photoLoc: "assets/avatars/avatar3.png"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar6.jfif"),
          Member(name: "Larry", photoLoc: "assets/avatars/avatar5.jfif")
        ]
    ),
  ];

  String get photo => _photo;
  int get notificationCount => _notificationCount;
  List<Member> get members => _members;
  List<TodoItem> get todoItems => _todoItems;
}


class TodoItem{
  String time;
  String day;
  String note;
  String bgText;
  IconData icon; // use with icon
  String iconLoc; // use with ImageIcon
  List<Member> members = [];

  TodoItem({this.time, this.day, this.note, this.members, this.bgText, this.icon, this.iconLoc});

  String getTime(){
    return "$day $time".toUpperCase();
  }
}

class Member{
  String name;
  String photoLoc;

  Member({this.name, this.photoLoc});
}