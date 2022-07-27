import 'package:dictionary_app/DetailPage.dart';
import 'package:dictionary_app/Words.dart';
import 'WordsResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

  List<Words> parseWordsResponse(String response){
    return WordsResponse.fromJson(json.decode(response)).wordsList;
  }

  Future<List<Words>> showAllWords() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php");
    var response = await http.get(url);

    return parseWordsResponse(response.body);
  }
  Future<List<Words>> search(String search) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/kelime_ara.php");
    var data = {"ingilizce":search};
    var response = await http.post(url,body: data);
    return parseWordsResponse(response.body);
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
        future: isSearching ? search(searchWord) : showAllWords(),
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
