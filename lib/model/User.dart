
class User{
  String _photo = "assets/avatars/avatar0.jpg";
  int _notificationCount = 12;
  List<Member> _members = [
    Member(
      name: "Joe",
      photoLoc: "assets/avatars/4.jfif"
    )
  ];

  String get photo => _photo;
  int get notificationCount => _notificationCount;
}


class TodoItem{
  String time;
  String day;
  String note;
  List<String> members = [];

  TodoItem({this.time, this.day, this.note, this.members});
}

class Member{
  String name;
  String photoLoc;

  Member({this.name, this.photoLoc});
}