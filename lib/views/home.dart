import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('Grocers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              // color: Colors.red,
              child: const Column(
                children: [
                  Text('Welcome Back' ,style: TextStyle(fontSize: 16 , color: Colors.black),),
                  Text('Greetings To All' ,style: TextStyle(fontSize: 16 , color: Colors.black),),
                ],
              ),
            )
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              color: Colors.green,
            )
          )
        ],
      ),
    );
  }
}
