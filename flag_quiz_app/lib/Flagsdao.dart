import 'package:flag_quiz_app/Flags.dart';
import 'package:flag_quiz_app/db/VeritabaniYardimcisi.dart';

class Flagsdao{

  Future<List<Flags>> get10Random() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 10");

  return List.generate(maps.length, (i) {
    var row = maps[i];
    return Flags(row["bayrak_id"], row["bayrak_ad"], row["bayrak_resim"]);
  });
  }
  Future<List<Flags>> get3Incorrect(int bayrak_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM bayraklar WHERE bayrak_id != $bayrak_id ORDER BY RANDOM() LIMIT 3");

  return List.generate(maps.length, (i) {
    var row = maps[i];
    return Flags(row["bayrak_id"], row["bayrak_ad"], row["bayrak_resim"]);
  });
  }
}