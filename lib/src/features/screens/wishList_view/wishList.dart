import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainBckgrnd,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: nuetralBck,
            )),
        title: const Text(
          'Wishlist ',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Favourited products (0 items)',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18,
                  color: textIcons,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                  radius: 100,
                  backgroundColor: textIcons.withOpacity(0.05),
                  child: Image.asset(
                    'assets/images/wishlist2rmbg.png',
                    width: 230,
                    height: 300,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Wish List is Empty',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'ADLaMDisplay',
                  color: textIcons),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Save products you like in Wish List',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textIcons),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
