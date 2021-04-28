import 'board_item_object.dart';

class BoardListObject {
  int id;
  String statusTitle;
  List<BoardItemObject> items;

  BoardListObject({this.id, this.statusTitle, this.items}) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.statusTitle == null) {
      this.statusTitle = "";
    }
    if (this.items == null) {
      this.items = [];
    }
  }
}
