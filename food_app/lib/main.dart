//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/DetailPage.dart';
import 'package:food_app/foods.dart';

import 'foods.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  Future<List<foods>> foodGet() async{

    var foodList = <foods>[];
    
    var f1 = foods(1,"Hamburger","hamburger.jpg",45.99);
    var f2 = foods(2,"Pizza","pizza.png",65.99);
    var f3 = foods(3,"Patates Kızartması","fries.jpg",25.99);
    var f4 = foods(4,"Dondurma","icecream.jpg",25.99);
    var f5 = foods(5,"Ayran","ayran.jpg",5.99);
    var f6 = foods(6,"Kola","kola.png",9.99);

    foodList.add(f1);
    foodList.add(f2);
    foodList.add(f3);
    foodList.add(f4);
    foodList.add(f5);
    foodList.add(f6);

    return foodList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
      ),
      body: FutureBuilder<List<foods>>(
        future: foodGet(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var foodList = snapshot.data;

            return ListView.builder(
              itemCount: foodList!.length,
              itemBuilder: (context,indeks){
                var food = foodList[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: food,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage("pictures/${food.foodName}"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(food.foodName,style: const TextStyle(fontSize: 25),),
                            const SizedBox(height: 50,),
                            Text("${food.foodPrice} \u{20BA}",style: const TextStyle(fontSize: 19, color: Colors.purple),),
                          ],
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
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
