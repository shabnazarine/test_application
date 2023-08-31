class SubItem{
  String id;
  int unitPrice;
  String itemName;
  String subTitle;
  String unitOfMeasure;
  int minutes;
  int sort;

  SubItem(this.id, this.unitPrice, this.itemName, this.subTitle,
      this.unitOfMeasure, this.minutes, this.sort);

  SubItem.fromJson(Map <String, dynamic>  json)
      : id = json['id'],
        unitPrice = json['unitPrice'],
        itemName = json['itemName'],
        subTitle = json['subTitle'],
        unitOfMeasure = json['id'],
        minutes = json['minutes'],
        sort = json['sort'];

  Map<String, dynamic> toJson(){
    return {'id': id, 'unitPrice': unitPrice, 'itemName': itemName, 'subTitle': subTitle,
      'unitOfMeasure': unitOfMeasure, 'minutes': minutes, 'sort': sort};
  }
}