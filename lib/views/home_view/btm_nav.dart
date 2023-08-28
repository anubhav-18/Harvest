import 'package:flutter/material.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/home_view/home.dart';

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

int selectedIndex = 0 ;
List screenList = [
  const HomePage(),
  Container(
    color: Colors.red,
  ),
  Container(
    color: Colors.blue,
  ),
  Container(
    color: Colors.green,
  ),
];


class _BtmNavBarState extends State<BtmNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread ,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        selectedItemColor: mainBckgrnd,
        unselectedItemColor: blackclr.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        backgroundColor: nuetralBck,
        elevation: 8,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value ; 
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category,), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'WishList')
      ]),
    );
  }
}
