import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

// class MyOrders extends StatefulWidget {
//   const MyOrders({super.key});

//   @override
//   State<MyOrders> createState() => _MyOrdersState();
// }

// class _MyOrdersState extends State<MyOrders> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: mainBckgrnd,
//         automaticallyImplyLeading: false,
//         leading: GestureDetector(
//             onTap: () => Get.back(),
//             child: const Icon(
//               Icons.arrow_back_ios,
//               size: 22,
//               color: nuetralBck,
//             )),
//         title: const Text(
//           'My Order',
//           style: TextStyle(
//             fontSize: 22,
//             color: nuetralBck,
//             fontFamily: 'ADLaMDisplay',
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.separated(
//                 physics: const BouncingScrollPhysics(),
//                   separatorBuilder: (context, index) {
//                     return const SizedBox(height: 15,);
//                   },
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, index) {
//                     return ListTile(
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 1,color: textIcons.withOpacity(0.1)),
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       onTap: () {},
//                       leading:
//                           Image.asset('assets/images/categories/dairynbakery.png'),
//                       title: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 5,),
//                           Text(
//                             'Delivered',
//                             style: TextStyle(
//                                 color: textIcons,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 2,),
//                           Text(
//                             'Delivered, May 17',
//                             style: TextStyle(fontSize: 14,color: textIcons),
//                           ),
//                           SizedBox(height: 2,),
//                           Text(
//                             'Groceries (4 itmes)',
//                             style: TextStyle(fontSize: 13,color: textIcons ,fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 5,)
//                         ],
//                       ),
//                       trailing: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.navigate_next,
//                             color: mainBckgrnd,
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
          'My Order',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                  radius: 120,
                  backgroundColor: yellowclr.withOpacity(0.3),
                  child: Image.asset(
                    'assets/images/order_not_1.png',
                    width: 200,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Were waiting for your first order',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'ADLaMDisplay', color: textIcons),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Shop from your variety of our products and grab the best deals on your order.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: textIcons),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.9, height * 0.065),
                      backgroundColor: mainBckgrnd,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: const Text(
                    'Explore Products',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
