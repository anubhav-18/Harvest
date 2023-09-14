import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({
    super.key,
  });

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController animationController;
  late Animation<Color?> buttonColor;
  late Animation<double> animateIcons;
  Curve curve = Curves.easeOut;

  @override
  initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    animateIcons =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    buttonColor = ColorTween(begin: Colors.red, end: Colors.blue).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.00, 1.00, curve: Curves.linear)));
    super.initState();
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Future<dynamic> dialogBox() {
    return showDialog(
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
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                color: greyclr.withOpacity(0.1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          softWrap: true,
                                          textScaleFactor: 1,
                                          maxLines: 2,
                                          text: TextSpan(
                                            style: const TextStyle(
                                                fontSize: 15, color: textIcons),
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16.0),
        AnimatedBuilder(
            animation: animationController,
            builder: (context, index) {
              return Transform.rotate(
                angle: animationController.value * (3.14 / 4),
                child: FloatingActionButton(
                  backgroundColor: darkBlue,
                  elevation: 12,
                  onPressed: dialogBox,
                  tooltip: 'Toggle',
                  child: Icon(
                    isOpened ? Icons.close : Icons.widgets,
                  ),
                ),
              );
            })
      ],
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
