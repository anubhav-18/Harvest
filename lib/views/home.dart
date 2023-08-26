import 'package:flutter/material.dart';
import 'package:grocers/constants/colour.dart';

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
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: mainBckgrnd,
        toolbarHeight: 150,
        flexibleSpace: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 0, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Harvest',
                    style: TextStyle(
                      fontSize: 24,
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.account_circle_sharp,
                        size: 35,
                        color: textIcons,
                      )),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 32,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                      child: const Text(
                        '+ Add an Address',
                        style: TextStyle(
                            color: textIcons,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search 10000+ Products',
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
