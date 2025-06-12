import 'package:flutter/material.dart';
import 'package:memes_flutter/models/memes_model.dart';
import 'package:memes_flutter/services/memes_services.dart';
import 'package:memes_flutter/widgets/mems_card.dart';

class MemesHomePage extends StatefulWidget {
  const MemesHomePage({super.key});

  @override
  _MemesHomePageState createState() => _MemesHomePageState();
}

class _MemesHomePageState extends State<MemesHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  Color backgroundColor = Colors.deepPurple;

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    final fetchMems = await MemesServices.fetchMemes(context);
    setState(() {
      memes = fetchMems;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Meme App",
              style: TextStyle(fontFamily: 'Roboto', fontSize: 24),
            ),
            SizedBox(width: 8),
            Text(
              "Atii",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 5,
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : memes.isEmpty
            ? Center(
                child: Text(
                  "No Memes Found",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            : ListView.builder(
                itemCount: memes.length,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  final meme = memes[index];
                  return MemsCard(
                    title: meme.title,
                    imageUrl: meme.url,
                    ups: meme.ups,
                    postLink: meme.postLink,
                    onColorExtracted: (Color color) => setState(() {
                      backgroundColor = color;
                    }),
                  );
                },
              ),
      ),
    );
  }
}
