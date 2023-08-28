import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      fontSize: 25,
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed('/profilePage'),
                    child: const Icon(Icons.account_circle_sharp,
                        size: 35,
                        color: textIcons,),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 32,
                  child: add_An_Address(),
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
    );
  }
}

// ignore: camel_case_types
class add_An_Address extends StatelessWidget {
  const add_An_Address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (buildContext) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.50,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Delivery Location and Close Icon
                    Row(
                      children: [
                        const Text(
                          'Select Delivery Location',
                          style: TextStyle(
                              fontFamily: 'ADLaMDisplay',
                              fontSize: 23,
                              color: mainBckgrnd,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.close,
                              size: 25,
                              color: mainBckgrnd,
                            ))
                      ],
                    ),
                    //  Text
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5,),
                        child: Text(
                            'Select a delivery location to see product',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textIcons,
                            ),
                          ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 5,),
                        child: Text(
                            'avaialbitlity, offers and discounts.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textIcons,
                            ),
                          ),
                      ),
                    ),
                    //  Add an Address nxt Page Route
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 20),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: mainBckgrnd,
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(3, 4))
                                ]),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Positioned(
                                  top: 35,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.black.withOpacity(0.23),
                                    radius: 30,
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 29,
                                      child: Icon(
                                        Icons.add,
                                        color: mainBckgrnd,
                                        size: 50,
                                      ),
                                    ),
                                  )),
                              const Positioned(
                                  bottom: 28,
                                  child: Text(
                                    'Add an Address',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: textIcons,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ]),
                          ),
                        ),
                      ],
                    ),
                    // Enter a Pincode
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          // showModalBottomSheet(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //             top: Radius.circular(20))),
                          //     context: context,
                          //     builder: (context) {
                          //       return Container(
                          //         height: 220,
                          //         padding: EdgeInsets.all(10),
                          //         margin: EdgeInsets.all(20),
                          //         child: Column(
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 Text('Enter PIN code',
                          //                     style: TextStyle(
                          //                         fontSize: 20,
                          //                         fontWeight: FontWeight.bold)),
                          //                 Spacer(),
                          //                 InkWell(
                          //                     onTap: () {
                          //                       Navigator.pop(context);
                          //                       // Navigator.pop(context);
                          //                     },
                          //                     child: Icon(
                          //                       Icons.close,
                          //                       size: 25,
                          //                       color: bckGrndColor,
                          //                     ))
                          //               ],
                          //             ),
                          //             Row(
                          //               children: [
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       top: 15, bottom: 5),
                          //                   child: Text(
                          //                       'Enter PIN code to see product availabilty, offers'),
                          //                 ),
                          //               ],
                          //             ),
                          //             Row(
                          //               children: [
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       bottom: 15),
                          //                   child: Text('and discounts.'),
                          //                 ),
                          //               ],
                          //             ),
                          //             Row(
                          //               children: [
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       bottom: 10),
                          //                   child: Text(
                          //                     'PIN Code',
                          //                     style: TextStyle(
                          //                         fontWeight: FontWeight.bold,
                          //                         fontSize: 17),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.start,
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: [
                          //                 Expanded(
                          //                   flex: 65,
                          //                   child: TextFormField(
                          //                     textAlign: TextAlign.start,
                          //                     decoration: InputDecoration(
                          //                       hintText: 'Enter an Pincode',
                          //                       prefixIcon: Icon(
                          //                         Icons.place,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 // Spacer(),
                          //                 Expanded(flex: 10, child: SizedBox()),
                          //                 Expanded(
                          //                   flex: 25,
                          //                   child: ElevatedButton(
                          //                     onPressed: () {},
                          //                     style: ElevatedButton.styleFrom(
                          //                         backgroundColor: bckGrndColor,
                          //                         textStyle: TextStyle(
                          //                             color: Colors.white),
                          //                         shape: RoundedRectangleBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     30))),
                          //                     child: Text('Apply'),
                          //                   ),
                          //                 )
                          //               ],
                          //             )
                          //           ],
                          //         ),
                          //       );
                          //     });
                          // showBottomSheet(
                          //     context: context,
                          //     builder: (BuildContext) {
                          //       return SizedBox(
                          //         height: 100,
                          //         child: Column(
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 const Text('Enter PIN code'),
                          //                 const Spacer(),
                          //                 IconButton(
                          //                     onPressed: () {},
                          //                     icon: const Icon(Icons.close))
                          //               ],
                          //             ),
                          //             Row(
                          //               children: [
                          //                 SizedBox(
                          //                   width: 50,
                          //                   child: TextFormField(
                          //                     decoration: const InputDecoration(
                          //                         hintText: 'Enter an Pincode',
                          //                         prefixIcon: Icon(
                          //                             Icons.location_city)),
                          //                   ),
                          //                 )
                          //               ],
                          //             )
                          //           ],
                          //         ),
                          //       );
                          //     });
                        },
                        // Enter a Pincode
                        child: const Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: mainBckgrnd,
                              size: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Enter a pincode',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: textIcons,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Detect My location
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.my_location,
                            color: mainBckgrnd,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // _getCurrentPosition();
                              },
                              child: const Text(
                                'Detect my location',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: textIcons,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: const Text('+ Add an Address',
          style: TextStyle(
              fontSize: 18, color: textIcons, fontWeight: FontWeight.bold)),
    );
  }
}
