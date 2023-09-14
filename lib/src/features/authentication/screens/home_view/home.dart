import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/features/authentication/screens/Address_view/btm_nav_address.dart';
import 'package:grocers/src/features/authentication/screens/home_view/floating_view/floating_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExtended = false;

  // void _switchActionBar() {
  //   setState(() {
  //     isExtended = !isExtended;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: mainBckgrnd,
        toolbarHeight: 140,
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
                      fontSize: 25,
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed('/profilePage'),
                    child: const Icon(
                      Icons.account_circle_sharp,
                      size: 38,
                      color: textIcons,
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 32,
                  child: BtmNavAddress(),
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
                      fillColor: nuetralBck,
                      filled: true,
                      hintText: 'Search 10000+ Products',
                      hintStyle: TextStyle(color: textIcons),
                      contentPadding: EdgeInsets.all(0),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: textIcons,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: textIcons,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: nuetralBck),
                      )),
                ),
              )
            ],
          ),
        )),
      ),
      floatingActionButton: const FloatingButton(),
      
    );
  }
}

