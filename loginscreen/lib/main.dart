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
  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      backgroundColor: Colors.greenAccent ,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight/75),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.teal[800],
                  size: 128.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/100),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "User Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/100),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight/100),
                child: SizedBox(
                  width: screenWidth/2,
                  height: screenWidth/12.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      onPrimary: Colors.black54,
                    ),
                    child: Text("LOGIN",style: TextStyle(fontSize: screenWidth/25), ),
                    onPressed: (){
                      print("on pressed.");
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Text on tap");
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      "Sign Up",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: screenWidth/30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
