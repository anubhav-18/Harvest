import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocers/src/provider/location_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colour.dart';

class UserCheckLoc extends StatefulWidget {
  const UserCheckLoc({super.key});

  @override
  State<UserCheckLoc> createState() => _UserCheckLocState();
}

class _UserCheckLocState extends State<UserCheckLoc> {
  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: nuetralBck,
          ),
        ),
        title: const Text(
          'Delivery Location',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 5,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: greyclr.withOpacity(0.09),
                    filled: true,
                    hintText: 'Search for area, landmark',
                    hintStyle: const TextStyle(
                        color: textIcons,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 26,
                      color: textIcons,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                          color: Colors.transparent), // Change the color here
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                          color: Colors.transparent), // Change the color here
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(lp.latitude!, lp.longitude!),
                  zoom: 14.4743,
                ),
                zoomControlsEnabled: true,
                myLocationEnabled: true,
                markers: {
                  Marker(
                    markerId: const MarkerId('live_location'),
                    position: LatLng(lp.latitude!, lp.longitude!),
                    infoWindow: const InfoWindow(
                      title: 'Live Location',
                    ),
                    draggable: true,
                    
                  )
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Location',
                  style: TextStyle(
                    fontSize: 20,
                    color: textIcons,
                    fontFamily: 'ADLaMDisplay',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: lp.currentAddress ?? 'ddddddd',
                    style: TextStyle(
                      fontSize: 15,
                      color: textIcons.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 8,
        color: nuetralBck,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/addAddress'),
            child: Container(
              decoration: const BoxDecoration(
                color: mainBckgrnd,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Confirm Location',
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
