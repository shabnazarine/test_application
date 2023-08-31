import 'package:test_application/model/sub_item_model.dart';

class Item{
  final String displayText;
  int displayOrder;
  String imageUrl;
  bool isActive;
  int count;
  String id;
  List<SubItem> subItemList;


  Item(this.displayText, this.displayOrder, this.imageUrl, this.isActive,
      this.count, this.id, this.subItemList);
}