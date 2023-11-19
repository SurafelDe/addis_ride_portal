import 'operation_result.dart';

class Item {
  Item();

  String? id;
  String? merchantsId;
  String? name;
  String? description;
  List<String>? translatedNames;
  String? category;
  String? itemCode;
  List<String>? images;
  String? profileImage;
  double? price;
  bool? isAvailable;
  String? rating;

  factory Item.fromJson(Map<String, dynamic> json) =>
      Item()
        ..id = json['id'] as String?
        ..merchantsId = json['merchantsId'] as String?
        ..name = json['name'] as String?
        ..description = json['description'] as String?
        ..category = json['category'] as String?
        ..translatedNames = (json['translatedNames'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
        ..itemCode = json['itemCode'] as String?
        ..images = (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList()
        ..profileImage = json['profileImage'] as String?
        ..price = json['price'] as double?
        ..isAvailable = json['isAvailable'] as bool? ?? false
        ..rating = json['rating'] as String?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'merchantsId': merchantsId,
    'name': name,
    'description': description,
    'category': category,
    'translatedNames': translatedNames,
    'itemCode': itemCode,
    'images': images,
    'profileImage': profileImage,
    'price': price,
    'isAvailable': isAvailable,
    'rating': rating,
  };
}

class ItemListResponse extends OperationResult {
  List<Item>? items;
  Item? item;

  ItemListResponse({this.items, this.item});

  ItemListResponse.fromJson(Map<String, dynamic> json) {
    items = json['items'] != null
        ? List<Item>.from(json['items'].map((i) => Item.fromJson(i)))
        : null;
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}


