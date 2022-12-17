// ignore_for_file: file_names

class ProductDataModel{
  String? image_url;
  String? title;
  String? content_url;
  String? date_added;

  ProductDataModel({
    this.image_url,
    this.title,
    this.content_url,
    this.date_added,
  });

    ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    image_url = json['image_url'];
    title =json['title'];
    content_url = json['content_url'];
    date_added = json['date_added'];
  }


}