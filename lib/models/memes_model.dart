class Meme {
  final String postLink;
  final String subreddit;
  final String title;
  final String url;
  final bool nsfw;
  final bool spoiler;
  final String author;
  final int ups;
  final List<String> preview;

  Meme({
    required this.postLink,
    required this.subreddit,
    required this.title,
    required this.url,
    required this.nsfw,
    required this.spoiler,
    required this.author,
    required this.ups,
    required this.preview,
  });

  // Factory constructor to create Meme object from JSON
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
      postLink: json['postLink'] ?? '', // Default to empty string if null
      subreddit: json['subreddit'] ?? '', // Default to empty string if null
      title: json['title'] ?? '', // Default to empty string if null
      url: json['url'] ?? '', // Default to empty string if null
      nsfw: json['nsfw'] ?? false, // Default to false if null
      spoiler: json['spoiler'] ?? false, // Default to false if null
      author: json['author'] ?? '', // Default to empty string if null
      ups: json['ups'] ?? 0, // Default to 0 if null
      preview: List<String>.from(
        json['preview'] ?? [],
      ), // Convert preview to List<String>, default to empty list if null
    );
  }

  // Convert Meme object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'postLink': postLink,
      'subreddit': subreddit,
      'title': title,
      'url': url,
      'nsfw': nsfw,
      'spoiler': spoiler,
      'author': author,
      'ups': ups,
      'preview': preview,
    };
  }
}
