import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';

class BtmNavAddress extends StatelessWidget {
  const BtmNavAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (buildContext) {
              return Container(
                height: height * 0.50,
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
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
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
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
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
                        Container(
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
                          child: Stack(alignment: Alignment.center, children: [
                            Positioned(
                                top: 35,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.23),
                                  radius: 30,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 29,
                                    child: GestureDetector(
                                      onTap: () => Get.toNamed('/addAddress'),
                                      child: const Icon(
                                        Icons.add,
                                        color: mainBckgrnd,
                                        size: 50,
                                      ),
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
                      ],
                    ),
                    // Enter a Pincode
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          pinCodeBtmModal(context, height);
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
                              onPressed: () => Get.back(),
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


Future<dynamic> pinCodeBtmModal(BuildContext context, double height) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: height * .22,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Enter PIN code',
                      style: TextStyle(
                        fontSize: 20,
                        color: textIcons,
                        fontFamily: 'ADLaMDisplay',
                      )),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        size: 25,
                        color: mainBckgrnd,
                      ))
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Enter PIN code to see product availabilty, offers',
                  ),
                  Text('and discounts.'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'PIN Code',
                    style: TextStyle(
                        color: textIcons,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainBckgrnd)),
                        prefixIconColor: mainBckgrnd,
                        prefixIcon: Icon(
                          Icons.place,
                          fill: 1,
                        ),
                        labelText: 'Enter an Pincode',
                        labelStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textIcons,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainBckgrnd,
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'ADLaMDisplay',
                              color: textIcons),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text('Apply'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
