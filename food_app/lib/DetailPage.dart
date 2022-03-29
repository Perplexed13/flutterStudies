import 'package:flutter/material.dart';

import 'foods.dart';

class DetailPage extends StatefulWidget {

  late foods food;

  DetailPage({required this.food});



  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.foodName),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 160.0,
                backgroundImage: AssetImage("pictures/${widget.food.foodPic}"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("${widget.food.foodPrice} \u{20BA}",style: TextStyle(fontSize: 20,),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  child: const Text("ORDER"),
                  onPressed: (){
                    print("on Pressed");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
