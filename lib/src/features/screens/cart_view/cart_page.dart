import 'dart:math';
import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/constants/defaultPadding.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
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
//           'My Cart',
//           style: TextStyle(
//             fontSize: 22,
//             color: nuetralBck,
//             fontFamily: 'ADLaMDisplay',
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//           // IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.heart_fill)),
//         ],
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: CircleAvatar(
//                   radius: 150,
//                   backgroundColor: nuetralBck.withOpacity(0.3),
//                   child: Image.asset(
//                     'assets/images/cart_empty1.png',
//                     width: 300,
//                   )),
//             ),
//             const Text(
//               'Your Cart is Empty!',
//               style: TextStyle(
//                   fontSize: 22, fontFamily: 'ADLaMDisplay', color: textIcons),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "It's a nice day to buy the items you saved for later!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 16, fontWeight: FontWeight.bold, color: textIcons),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'or',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: textIcons),
//                 ),
//                 const SizedBox(width: 6,),
//                 GestureDetector(
//                   onTap: () => Get.toNamed('/btmNav'),
//                   child: const Text(
//                     'Continue Shopping',
//                     style:
//                         TextStyle(
//                           color: mainBckgrnd,
//                           fontSize: 16,
//                           fontFamily: 'ADLaMDisplay'),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _counter = 1;
  void _increment() {
    setState(() {
      _counter = min(_counter + 1, 6);
    });
  }

  void _decrement() {
    setState(() {
      _counter = max(_counter - 1, 1);
    });
  }

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
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: nuetralBck,
            )),
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: nuetralBck,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                margin: kDefaultPaddingWObottom,
                child: Row(
                  children: [
                    Text(
                      'Groceries Basket (${title.length})',
                      style: const TextStyle(
                        fontSize: 22,
                        color: textIcons,
                        fontFamily: 'ADLaMDisplay',
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '\u{20B9}479',
                      style: TextStyle(
                        fontSize: 22,
                        color: textIcons,
                        fontFamily: 'ADLaMDisplay',
                      ),
                    ),
                  ],
                ),
              ),
              // Product Tile
              Container(
                margin: kDefaultPaddingWObottom,
                color: whiteclr,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  // separatorBuilder: (context, index) {
                  //   return const Divider(
                  //     thickness: 1,
                  //   );
                  // },
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.24,
                      width: width * 1,
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    image[index],
                                    alignment: Alignment.center,
                                    width: width * 0.25,
                                    height: height * 0.15,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                        textDirection: TextDirection.ltr,
                                        text: TextSpan(
                                          text: title[index],
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: textIcons,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '\u{20B9}${newPrice[index]}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'ADLaMDisplay',
                                              color: textIcons),
                                          children: [
                                            const WidgetSpan(
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10))),
                                            TextSpan(
                                                text:
                                                    '\u{20B9}${oldPrice[index]}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: greyclr,
                                                    decoration: TextDecoration
                                                        .lineThrough))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: callToAction.withOpacity(0.23),
                                        ),
                                        child: Text(
                                          'You Save \u{20B9}${savePrice[index]}',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: callToAction,
                                            fontFamily: 'ADLaMDisplay',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text('Save for later',
                                        style: TextStyle(
                                            color: mainBckgrnd,
                                            fontSize: 14,
                                            fontFamily: 'ADLaMDisplay')),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  CircleAvatar(
                                    backgroundColor:
                                        textIcons.withOpacity(0.23),
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: whiteclr,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: _decrement,
                                              icon: const Icon(
                                                Icons.remove,
                                                color: mainBckgrnd,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '$_counter',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: textIcons,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        textIcons.withOpacity(0.23),
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 19,
                                      backgroundColor: whiteclr,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              onPressed: _increment,
                                              icon: const Icon(
                                                Icons.add,
                                                color: mainBckgrnd,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Apply Coupon
              Container(
                margin: kDefaultPaddingWObottom,
                decoration: BoxDecoration(
                    color: whiteclr, borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/coupon.png',
                    width: 25,
                  ),
                  title: const Text(
                    'Apply Coupon',
                    style: TextStyle(
                        fontSize: 20,
                        color: textIcons,
                        fontWeight: FontWeight.w900),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: textIcons,
                  ),
                ),
              ),
              // Payment Details
              Container(
                margin: kDefaultPadding,
                color: Colors.white,
                child: Container(
                  margin: kDefaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Details',
                        style: TextStyle(
                          fontSize: 25,
                          color: mainBckgrnd,
                          fontFamily: 'ADLaMDisplay',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          EditText(
                            text: 'MRP Total',
                          ),
                          const Spacer(),
                          EditText(
                            text: '2,410.00',
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 1,
                        color: blackclr.withOpacity(0.23),
                      ),
                      Row(
                        children: [
                          EditText(
                            text: 'Product Discount',
                          ),
                          const Spacer(),
                          EditText(
                            text: '- 559.00',
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 1,
                        color: blackclr.withOpacity(0.23),
                      ),
                      Row(
                        children: [
                          EditText(
                            text: 'Delivery Fee',
                          ),
                          const Spacer(),
                          EditText(
                            text: '40.00',
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 1,
                        color: blackclr.withOpacity(0.23),
                      ),
                      Row(
                        children: [
                          EditText(
                            text: 'Total',
                          ),
                          const Spacer(),
                          EditText(
                            text: '1,851.00',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // Bottom Bar / Payment Info
      bottomNavigationBar: Container(
        margin: kDefaultPaddingBttmNav,
        height: height * 0.08,
        // color: mainBckgrnd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '₹1,851.00',
                  style: TextStyle(
                    fontSize: 20,
                    color: textIcons,
                    fontFamily: 'ADLaMDisplay',
                  ),
                ),
                Text(
                  'you Saved ₹559.00 ',
                  style: TextStyle(
                    fontSize: 18,
                    color: mainBckgrnd,
                    fontFamily: 'ADLaMDisplay',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: redclr,
                  shape: RoundedRectangleBorder(
                      // side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(24))),
              child: const Text(
                'Place Order',
                style: TextStyle(
                    fontSize: 20, color: whiteclr, fontFamily: 'ADLaMDisplay'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EditText extends StatelessWidget {
  EditText({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: textIcons,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

List<String> title = [
  'Amul Butter 50g Carton',
  'Surf Excel Matic Top 2L ',
  'Amul Butter 50g Carton',
  'Surf Excel Matic Top 2L ',
];
List<String> newPrice = [
  '149',
  '330',
  '149',
  '330',
];
List<String> oldPrice = [
  '199',
  '430',
  '199',
  '430',
];
List<String> image = [
  'assets/images/amulbutter1.jpeg',
  'assets/images/surf1.jpeg',
  'assets/images/amulbutter1.jpeg',
  'assets/images/surf1.jpeg',
];
List<String> savePrice = [
  '50',
  '100',
  '50',
  '100',
];
