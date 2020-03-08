
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
    )
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
  List<Member> members = [];

  TodoItem({this.time, this.day, this.note, this.members});

  String getTime(){
    return "$day $time".toUpperCase();
  }
}

class Member{
  String name;
  String photoLoc;

  Member({this.name, this.photoLoc});
}