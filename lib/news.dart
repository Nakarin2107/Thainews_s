class NewsThailand {
  final String author;
  final String title;
  final String url;

  NewsThailand({
    required this.author,
    required this.title,
    required this.url,
  });

  factory NewsThailand.fromJson(Map<String, dynamic> json) {
    return NewsThailand(
      author: json['author'] ?? 'Unknown Author',
      title: json['title'] ?? 'Unknown Title',
      url: json['url'] ?? 'Unknown URL',
    );
  }
}