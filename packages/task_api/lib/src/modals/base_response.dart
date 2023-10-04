class BaseResponse{
  final String? author;
  final String? title;
  final String? urlToImage;
  final String ? url;
  final String ? publishedAt;
  const BaseResponse({
    this.author,
    this.title,
    this.urlToImage,
    this.url,
    this.publishedAt,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> map)=>BaseResponse(
      author: map['author'] ,
      title: map['title'] ,
      urlToImage: map['urlToImage'],
      url:map['url'],
      publishedAt:map['publishedAt']
  );
}