class Words {
  String wordId;
  String english;
  String turkish;

  Words(
    this.wordId,
    this.english,
    this.turkish,
  );

  factory Words.fromJson(Map<String,dynamic> json){
    return Words(json["kelime_id"] as String, 
    json["ingilizce"] as String, json["turkce"] as String);
  }

  
}
