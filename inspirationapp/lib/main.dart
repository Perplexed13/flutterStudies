import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Inspiring  App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi/100,bottom: ekranYuksekligi/100),
            child: Center(
              child: SizedBox(
                  width: ekranGenisligi/2,
                  //height: ekranGenisligi/2,
                  child: Center(child: Image.asset("pictures/erentatakae.jpg"))),
            ),
          ),
          Text("Eren Jaeger",
            style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: ekranGenisligi/30,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(ekranGenisligi/1000),
            child: Text("TATAKAE TATAKAE TATAKAE TATAKAE TATAKAE TATAKAE TATAKAE TATAKAE TATAKAE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ekranGenisligi/35,
    ),

              ),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: ekranYuksekligi/50),
            child: SizedBox(
              width: ekranGenisligi/4,
             // height: ekranYuksekligi/15,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text("TATAKAE", style:
                TextStyle(
                    fontSize: ekranGenisligi/25,
                  color: Colors.white,
                  ),
                ),
                onPressed: (){
                  print("Inspiration is given");
                },
              ),
            ),
          ),
        ],

      )
    );
  }
}
