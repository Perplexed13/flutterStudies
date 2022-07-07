import 'package:dictionary_app/DetailPage.dart';
import 'package:dictionary_app/Words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(key),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage(Key? key) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSearching = false;
  String searchWord = "";

  Future<List<Words>> showAllWords() async{
    var wordsList = <Words>[];

    var w1 = Words(1, "Dictionary", "Sozluk");
    var w2 = Words(2, "Word", "Kelime");
    var w3 = Words(3, "Future", "Gelecek");

    wordsList.add(w1);
    wordsList.add(w2);
    wordsList.add(w3);
    
    return wordsList;
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? TextField(
          decoration: const InputDecoration(hintText: "Search"),
          onChanged: (searchResult){
            // ignore: avoid_print
            print("Search result is: $searchResult");
            setState(() {
              searchWord = searchResult;
            });
          },
        )  : const Text("Dictionary"),
        actions: [
         isSearching ? 
         IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                isSearching = false;
                searchWord = "";
              });
            },
          )
         :IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              setState(() {
                isSearching = true;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Words>>(
        future: showAllWords(),
        builder: (context,snapshot){
          if(snapshot.hasData){
              var tmpWordsList = snapshot.data;
              return ListView.builder(
                itemCount: tmpWordsList!.length,
                itemBuilder: (context,index){
                  var tmpWord = tmpWordsList[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(words: tmpWord,),));
                    },
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(tmpWord.english,style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text(tmpWord.turkish),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );

          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
