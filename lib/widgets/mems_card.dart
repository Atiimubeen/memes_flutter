import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MemsCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int ups;
  final String postLink;
  final Function(Color) onColorExtracted;

  const MemsCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.ups,
    required this.postLink,
    required this.onColorExtracted,
  });

  @override
  State<MemsCard> createState() => _MemsCardState();
}

class _MemsCardState extends State<MemsCard> {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundColor.withOpacity(0.5), Colors.deepPurple],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 500),
                fadeOutDuration: Duration(milliseconds: 500),
              ),
              SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "${widget.ups} Upvotes",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Implement postLink opening
                },
                child: Text(
                  "View Post",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
