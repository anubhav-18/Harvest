import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/cart_view/cart_page.dart';
import 'package:grocers/views/home_view/home.dart';
import 'package:grocers/views/order_view/orderPage.dart';
import 'package:grocers/views/wishList_view/wishList.dart';

class BtmNavBar extends StatefulWidget {
  final int index;
  const BtmNavBar({super.key, this.index = 0});
  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  // final PageController _pageController = PageController();
  // void initState() {
  //   super.initState();
  //   _btmnavindex = widget.index;
  // }

  int _btmnavindex = 0;

  void _onItemTapped(int index) {
    if (index != 3) {
      setState(() {
        _btmnavindex = index;
      });
      
      print(index);
    } else {
      Get.toNamed('/cartPage');
    }

    
  }

  Widget pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          return const WishList();
        }
      case 2:
        {
          return const MyOrders();
        }
    }
    return Container(
      color: Colors.red,
    );
  }

  // final List<Widget> screenList = [
  //   const HomePage(),
  //   const WishList(),
  //   const MyOrders(),
  //   const CartPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pageCaller(_btmnavindex)),
      // IndexedStack(
      //   index: _btmnavindex,
      //   children: screenList,
      // ),
      // screenList.elementAt(_btmnavindex),
      bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 30,
          selectedItemColor: mainBckgrnd,
          unselectedItemColor: blackclr.withOpacity(0.7),
          selectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: nuetralBck,
          elevation: 8,
          currentIndex: _btmnavindex,
          onTap: _onItemTapped,
          // (value) {
          //   setState(() {
          //     _btmnavindex = value ;
          //   });
          // },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: 'WishList'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart'),
          ]),
    );
  }
}

// class Settings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Center(
//         child: Text("Settings"),
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
// class BtmNav extends StatefulWidget {
//   int index ;
//   BtmNav({super.key, this.index = 0 });

//   @override
//   State<BtmNav> createState() => _BtmNavState();
// }

// class _BtmNavState extends State<BtmNav> {
//   List screenList = [
//     const HomePage(),
//     const WishList(),
//     const MyOrders(),
//     Container(
//       color: Colors.green,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       // pageCaller(_btmnavindex),
//       screenList.elementAt(widget.index),
//       bottomNavigationBar: BottomNavigationBar(
//           landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           iconSize: 30,
//           selectedItemColor: mainBckgrnd,
//           unselectedItemColor: blackclr.withOpacity(0.7),
//           selectedLabelStyle:
//               const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           unselectedLabelStyle:
//               const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: nuetralBck,
//           elevation: 8,
//           currentIndex: widget.index,
//           onTap:
//           //  _onItemTapped,
//           (value) {
//             setState(() {
//               widget.index = value ;
//             });
//             print(widget.index);
//           },
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home_outlined), label: 'Home'),
//             BottomNavigationBarItem(
//                 icon: Icon(CupertinoIcons.heart), label: 'WishList'),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.shopping_bag_outlined,
//                 ),
//                 label: 'Orders'),
//             BottomNavigationBarItem(
//                 icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart'),
//           ]),
//     );
  
//   }
// }
