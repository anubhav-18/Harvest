import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';
import 'package:grocers/src/provider/location_provider.dart';
import 'package:provider/provider.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController houseNoController = TextEditingController();
    TextEditingController addressline1Controller = TextEditingController();
    TextEditingController addressline2Controller = TextEditingController();
    TextEditingController landmarkController = TextEditingController();
    TextEditingController floorNoController = TextEditingController();
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
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      SaveAsButton(
                        title: 'Home',
                      ),
                      SaveAsButton(
                        title: 'Work',
                      ),
                      SaveAsButton(
                        title: 'Other',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
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
          child: GestureDetector(
            onTap: () {},
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
}

class SaveAsButton extends StatelessWidget {
  const SaveAsButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: mainBckgrnd, width: 1))),
            backgroundColor: getColor(Colors.transparent, mainBckgrnd),
            // elevation: 0,
            // backgroundColor: nuetralBck,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(25),
            //   side: const BorderSide(
            //       color: mainBckgrnd, width: 1),
            // ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: mainBckgrnd,
            ),
          )),
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  getColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  }

  return MaterialStateProperty.resolveWith(getColor);
}
