

class ArticleModel{
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String name;

  ArticleModel({this.title, this.description, this.url, this.urlToImage, this.content, this.name});

  factory ArticleModel.fromJSON(Map<String, dynamic> json){
    return ArticleModel(
      title: json["title"],
      description: json["description"],
      urlToImage: json['urlToImage'],
      url: json['url'],
      content: json['content'],
      name: json['source']['name'],
    );
  }

}