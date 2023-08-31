import 'package:flutter/material.dart';
import 'package:grocers/constants/colour.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // isExtended: isExtended,
      elevation: 12,
      backgroundColor: darkBlue,
      child: const Icon(Icons.widgets),
      // label: const Text(
      //   'Categories',
      //   style: TextStyle(
      //     color: nuetralBck,
      //     fontFamily: 'ADLaMDisplay',
      //   ),
      // ),
      // icon: const Icon(Icons.widgets),
      // AnimatedSwitcher(
      //   duration: const Duration(seconds: 1),
      //   transitionBuilder: (Widget child, Animation<double> animation) =>
      //       FadeTransition(
      //     opacity: animation,
      //     child: SizeTransition(
      //       axis: Axis.horizontal,
      //       sizeFactor: animation,
      //       child: child,
      //     ),
      //   ),
      //   child: isExtended
      //       ? const Row(
      //           children: [
      //             Padding(padding: EdgeInsets.only(right: 8),
      //             child: Icon(Icons.widgets,color: nuetralBck,),
      //             ),
      //             Text('Categories')
      //           ],
      //         )
      //       : const Icon(Icons.add,color: nuetralBck,),
      // ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                insetPadding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: nuetralBck),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shop Form Categories',
                        style: TextStyle(
                            fontSize: 18,
                            color: textIcons,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 1,
                        color: textIcons,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: categoryTitle.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 70,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 10),
                                    color: greyclr.withOpacity(0.1),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              textDirection:
                                                  TextDirection.ltr,
                                              softWrap: true,
                                              textScaleFactor: 1,
                                              maxLines: 2,
                                              text: TextSpan(
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: textIcons),
                                                text: categoryTitle[index],
                                              )),
                                        ),
                                        Image.asset(
                                          categoryImg[index],
                                          alignment: const Alignment(1, 1),
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}



List<String> categoryTitle = [
  'Fresh Fruit',
  'Fresh Vegetable',
  'Daily, Bread & Eggs',
  'Beverages',
  'Atta, Dal & Rice',
  'Masala & Oil ',
  'Dry Fruits',
  'Instant Foods',
  'Breakfats & Spreads',
  'Cleaning & Household',
  'Chocolates & Deserts',
  'Personal Care',
  'Baby Care',
  'Pet Care',
];

List<String> categoryImg = [
  'assets/images/categories/beverages.png',
  'assets/images/categories/dairynbakery.png',
  'assets/images/categories/homecare.png',
  'assets/images/categories/snaacks.png',
  'assets/images/categories/beverages.png',
  'assets/images/categories/dairynbakery.png',
  'assets/images/categories/homecare.png',
  'assets/images/categories/snaacks.png',
  'assets/images/categories/beverages.png',
  'assets/images/categories/dairynbakery.png',
  'assets/images/categories/homecare.png',
  'assets/images/categories/snaacks.png',
  'assets/images/categories/beverages.png',
  'assets/images/categories/dairynbakery.png',
];
