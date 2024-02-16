import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';
import 'package:grocers/src/features/models/user_model.dart';
import 'package:grocers/src/provider/address_provider.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:grocers/src/provider/location_provider.dart';
import 'package:grocers/src/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/saveAsButton.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  String selectedLabel = '';
  bool showOtherTextField = false;
  TextEditingController houseNoController = TextEditingController();
  TextEditingController addressline1Controller = TextEditingController();
  TextEditingController addressline2Controller = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController floorNoController = TextEditingController();
  TextEditingController emptyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: nuetralBck,
          ),
        ),
        title: const Text(
          'Add Address',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(lp.latitude!, lp.longitude!),
                        zoom: 14.4746),
                    mapType: MapType.normal,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Address Details',
                    style: TextStyle(
                      fontSize: 20,
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                    ),
                  ),
                ),
                ReuseTextField(
                    controller: houseNoController,
                    labelText: "",
                    placeholder: "House No.",
                    isPasswordTextField: false),
                ReuseTextField(
                    controller: floorNoController,
                    labelText: "",
                    placeholder: "Floor No.",
                    isPasswordTextField: false),
                ReuseTextField(
                    controller: addressline1Controller,
                    labelText: "",
                    placeholder: "Address Line 1",
                    isPasswordTextField: false),
                ReuseTextField(
                    controller: addressline2Controller,
                    labelText: "",
                    placeholder: "Address Line 2",
                    isPasswordTextField: false),
                ReuseTextField(
                    controller: landmarkController,
                    labelText: "",
                    placeholder: "Landmark",
                    isPasswordTextField: false),
                const SizedBox(height: 30),
                Divider(
                  color: textIcons.withOpacity(0.1),
                  thickness: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Save As',
                    style: TextStyle(
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 20,
                      color: textIcons,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      SaveAsButton(
                        title: 'Home',
                        isSelected: selectedLabel == 'Home',
                        onPressed: () {
                          setState(() {
                            selectedLabel = 'Home';
                            showOtherTextField = false;
                          });
                        },
                      ),
                      SaveAsButton(
                        title: 'Work',
                        isSelected: selectedLabel == 'Work',
                        onPressed: () {
                          setState(() {
                            selectedLabel = 'Work';
                            showOtherTextField = false;
                          });
                        },
                      ),
                      SaveAsButton(
                        title: 'Other',
                        isSelected: selectedLabel == 'Other',
                        onPressed: () {
                          setState(() {
                            selectedLabel = 'Other';
                            showOtherTextField = true;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                // const SizedBox(height: 30),
                Visibility(
                  visible: showOtherTextField,
                  child: ReuseTextField(
                      controller: emptyController,
                      labelText: "",
                      placeholder: "Please Specify",
                      isPasswordTextField: false),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: nuetralBck,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () => storeAddData(),
            child: Container(
              decoration: const BoxDecoration(
                color: mainBckgrnd,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Save & Proceed',
                style: TextStyle(
                  fontFamily: 'ADLaMDisplay',
                  fontSize: 20,
                  color: nuetralBck,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void storeAddData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    // final userModel = Provider.of<UserModel>(context, listen: false);
    final addprovider = Provider.of<AddressProvider>(context, listen: false);
    UserModel userModel = await ap.getDataFromFirestore();
    Address address = Address(
      label: selectedLabel,
      houseNo: houseNoController.text.trim(),
      floorNo: floorNoController.text.trim(),
      address1: addressline1Controller.text.trim(),
      address2: addressline2Controller.text.trim(),
      landmark: landmarkController.text.trim(),
    );
    if (houseNoController.text.trim().isNotEmpty &&
        floorNoController.text.trim().isNotEmpty &&
        selectedLabel.isNotEmpty &&
        addressline1Controller.text.trim().isNotEmpty) {

      userModel?.addresses ??= [];

      userModel!.addresses!.add(address);

      // if (userModel.addresses == null) {
      //   userModel.addresses = []; // Initialize with an empty list if null
      // }
      // List updatedAddress = List.from(userModel.addresses as Iterable)
      //   ..add(address);
      // userModel.addresses = updatedAddress;

      addprovider.addAddress(
        userModel: userModel,
        address: address,
        context: context,
      );

      Navigator.pushNamedAndRemoveUntil(context, '/btmNav', (route) => false);

      showSnackBar(context, 'Address Added Successfuly');
    }
  }

}
