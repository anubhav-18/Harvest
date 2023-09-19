import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/features/models/user_model.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileDash extends StatefulWidget {
  const ProfileDash({super.key});

  @override
  State<ProfileDash> createState() => _ProfileDashState();
}

class _ProfileDashState extends State<ProfileDash> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    List<Function()?> onTapList = [
      //My Orders
      () {},
      //My Payemnts
      () {},
      //Ratings & Reviews
      () {},
      //Notifications
      () {},
      //My Delivery Address
      () {},
      //Customer Service
      () {},
      //About
      () {},
      //Logout
      () => ap.signOut().then((value) => Navigator.of(context)
          .pushNamedAndRemoveUntil('/loginPage', (route) => false)),
    ];

    List<IconData> iconList = [
      Icons.shopping_bag_outlined,
      Icons.payment_outlined,
      Icons.rate_review_outlined,
      Icons.notifications_active_outlined,
      Icons.delivery_dining_outlined,
      Icons.help_center_outlined,
      Icons.help_outline,
      Icons.logout_outlined
    ];

    List<String> titleList = [
      'My Orders',
      'My Payments',
      'Ratings & Reviews',
      'Notifications',
      'My Delivery Address',
      'Customer Service',
      'About',
      'Logout'
    ];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: mainBckgrnd,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/btmNav'),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: nuetralBck,
            ),
          ),
          title: const Text(
            'Harvest',
            style: TextStyle(
              fontSize: 22,
              color: nuetralBck,
              fontFamily: 'ADLaMDisplay',
            ),
          ),
        ),
        body: FutureBuilder(
            // stream: FirebaseFirestore.instance.collection('users').doc(ap.userModel.uid).snapshots(),
            future: ap.getDataFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30,
                        child: Text('My Account',
                            style: TextStyle(
                              fontSize: 20,
                              color: textIcons,
                              fontFamily: 'ADLaMDisplay',
                            )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        color: accentColor,
                        child: Stack(
                          children: [
                            const Positioned(
                                top: 5,
                                left: 5,
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 85,
                                  color: nuetralBck,
                                )),
                            Positioned(
                                top: 10,
                                left: 100,
                                child: Text(
                                  "${userData.firstName.capitalize()} ${userData.lastName.capitalize()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: nuetralBck,
                                    fontFamily: 'ADLaMDisplay',
                                  ),
                                )),
                            Positioned(
                                top: 35,
                                left: 100,
                                child: Text(
                                  userData.email,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: nuetralBck,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Positioned(
                                top: 60,
                                left: 100,
                                child: Text(
                                  userData.phoneNo,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: nuetralBck,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed('/editProfile'),
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: nuetralBck,
                                    size: 27,
                                  ),
                                )),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: nuetralBck,
                                ),
                                child: Stack(
                                  children: [
                                    const Positioned(
                                        bottom: 15,
                                        left: 15,
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: accentColor,
                                          size: 27,
                                        )),
                                    Positioned(
                                        bottom: 12,
                                        left: 55,
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: RichText(
                                              overflow: TextOverflow.clip,
                                              textDirection: TextDirection.ltr,
                                              softWrap: true,
                                              maxLines: 2,
                                              textScaleFactor: 1,
                                              text: const TextSpan(
                                                  text:
                                                      '156/35, Neerav Nikunj, Sikandra, Agra, 282007',
                                                  style: TextStyle(
                                                      color: textIcons))),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 20,
                                      child: TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pushNamed('/savedAddress'),
                                        // Get.toNamed('/savedAddress'),
                                        style: TextButton.styleFrom(
                                            side: const BorderSide(
                                                width: 1, color: accentColor)),
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: accentColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: iconList.length,
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 8,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: onTapList[index],
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: nuetralBck,
                                  child: Icon(
                                    iconList[index],
                                    size: 22,
                                    color: textIcons,
                                  ),
                                ),
                                title: Text(
                                  titleList[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: blackclr,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                      ),
                    
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else {
                  return const Center(
                    child: Text('Something has Error hello guys '),
                  );
                }
              }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }

            }));
  
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class DropDownGender extends StatefulWidget {
  const DropDownGender({super.key});

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  String selectedValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(5),
      value: selectedValue,
      items: const [
        DropdownMenuItem(
          value: "Male",
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: "Female",
          child: Text('Female'),
        ),
        DropdownMenuItem(
          value: "Others",
          child: Text('Others'),
        ),
        DropdownMenuItem(
          value: "Unspecified",
          child: Text('Unspecified'),
        ),
      ],
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.only(bottom: 30),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: textIcons, width: 2, style: BorderStyle.solid)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: mainBckgrnd, width: 2, style: BorderStyle.solid)),
        errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: redclr, width: 2, style: BorderStyle.solid)),
      ),
    );
  }
}
