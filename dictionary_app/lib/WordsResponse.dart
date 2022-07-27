import 'package:dictionary_app/Words.dart';

class WordsResponse{
  int success;
  List<Words> wordsList;

  WordsResponse(this.success,this.wordsList);

   factory WordsResponse.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kelimeler"] as List;
    List<Words> wordsList = jsonArray.map((jsonArrayObject) => Words.fromJson(jsonArrayObject)).toList();
    return WordsResponse(json ["success"] as int, wordsList);
  }
}