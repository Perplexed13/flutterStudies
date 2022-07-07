import 'package:flutter/material.dart';

import 'Words.dart';

class DetailPage extends StatefulWidget {
  Words words;

  DetailPage({Key? key, required this.words}) : super(key: key);

  



  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.words.english,style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(widget.words.turkish,style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}