import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({super.key});

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBckgrnd,
        elevation: 0,
        title: const Text(
          'Select Address',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: nuetralBck,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Addresses',
              style: TextStyle(
                  fontFamily: 'ADLaMDisplay',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textIcons),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: titleAddress.length ,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20,);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      minVerticalPadding: -5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1, color: textIcons.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(20)),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text( titleAddress[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'ADLaMDisplay',
                                ),
                              ),
                              const Spacer(),
                              PopupMenuButton(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1,color: nuetralBck),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                  itemBuilder: (BuildContext context) => [
                                    popMenuItemsList('Edit', Icons.edit),
                                    popMenuItemsList('Delete', Icons.delete)
                                  ]),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.ltr,
                                    softWrap: true,
                                    maxLines: 3,
                                    textScaleFactor: 1,
                                    text: TextSpan(
                                      text: fullAddress[index],
                                      style: const TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: textIcons,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.10,
                              ),
                            ],
                          ),
                          Text( ('Phone: ${phoneAddress[index]}'),
                            style: const TextStyle(
                              // fontFamily: 'ADLaMDisplay',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: textIcons,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: nuetralBck,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: textIcons.withOpacity(0.7))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => Get.toNamed('/addAddress'),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(color: Colors.black.withOpacity(0.5))),
                height: 45,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 28,
                    ),
                    Text(
                      'Add New Address',
                      style: TextStyle(
                        fontFamily: 'ADLaMDisplay',
                        fontSize: 20,
                        color: mainBckgrnd,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    
    );
  } 
}

PopupMenuItem<dynamic> popMenuItemsList(String title, IconData icon) {
    return PopupMenuItem(
        onTap: () {},
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 22 ,weight: 4,color: textIcons,), 
            const SizedBox(width: 15,),
            Text(title,style: const TextStyle(fontSize: 16,color: textIcons, fontWeight: FontWeight.bold),)],
        ));
  }

List<String> titleAddress = [
  'Anubhav Bindal',
  'Vansh Bindal',
  'Hardik Barhate',
];

List<String> fullAddress = [
  '156/35, Neerav Nikunj, Sikandra, Agra, in fornt of kk bar, Agra, Uttar Pradesh, 282007',
  '156/35, Neerav Nikunj, Sikandra, Agra, in fornt of kk bar, Agra, Uttar Pradesh, 282007, Nerav Nikunj, Sikandra , agra , up',
  '156/35, Neerav Nikunj, Sikandra, Agra, in fornt of kk bar, Agra,',
];

List<String> phoneAddress = [
  '8881284276',
  '9412800087',
  '6395836564',
];



