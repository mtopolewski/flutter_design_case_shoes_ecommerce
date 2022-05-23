import 'package:flutter/material.dart';
import 'dart:math' as Math;

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const buttonWidth = 56;
    const selectedButtonWidth = 50;
    var remainingSpace = width - 4 * buttonWidth;
    var spaceBetween = remainingSpace / 5;
    const x = 1;
    var y = x > 0 ? x - 1 : 0;

    // var test = (x + 1) * spaceBetween +
    //     x * buttonWidth +
    //     buttonWidth / 2 -
    //     selectedButtonWidth / 2;

    var test0 = 1 * spaceBetween +
        0 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test1 = 2 * spaceBetween +
        1 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test2 = 3 * spaceBetween +
        2 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test3 = 4 * spaceBetween +
        3 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    return Stack(
      children: [
        ClipPath(
          clipper: BottomMenuClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3858DA),
                  Color(0xFF8C78EF),
                ],
              ),
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  BottomBarButton(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    text: "Saved",
                  ),
                  BottomBarButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    text: "Home",
                  ),
                  BottomBarButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    text: "My Order",
                  ),
                  BottomBarButton(
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.white,
                    ),
                    text: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: test0,
          child: const SelectedButton(
            icon: Icons.favorite_outline,
          ),
        ),
        Positioned(
          left: test1,
          child: const SelectedButton(icon: Icons.home_outlined),
        ),
        Positioned(
          left: test2,
          child: const SelectedButton(
            icon: Icons.shopping_cart_outlined,
          ),
        ),
        Positioned(
          left: test3,
          child: const SelectedButton(icon: Icons.person_outlined),
        ),
      ],
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({Key? key, required this.text, required this.icon})
      : super(key: key);
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        onTap: () {},
        child: Ink(
          decoration: const BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.all(
            Radius.circular(6),
          )),
          width: 56,
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'CoreSans',
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                  height: 1.8,
                  wordSpacing: -1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => _getPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  double degToRad(num deg) => deg * (Math.pi / 180.0);
  num radToDeg(double rad) => rad * 180.0 / Math.pi;

  Path _getPath(Size size) {
    var width = size.width;
    const buttonWidth = 56;
    const selectedButtonWidth = 50;
    var remainingSpace = width - 4 * buttonWidth;
    var spaceBetween = remainingSpace / 5;
    const x = 1;
    var y = x > 0 ? x - 1 : 0;

    var test = (x + 1) * spaceBetween +
        x * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test0 = 1 * spaceBetween +
        0 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test1 = 2 * spaceBetween +
        1 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test2 = 3 * spaceBetween +
        2 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var test3 = 4 * spaceBetween +
        3 * buttonWidth +
        buttonWidth / 2 -
        selectedButtonWidth / 2;

    var path = Path();
    var initMargin = 10.0;
    path.moveTo(0, initMargin + 40);

    // path.arcTo(
    //   //Rect.fromCircle(center: Offset(10, initMargin + 40), radius: 10),
    //   Rect.fromCircle(center: Offset(10, initMargin + 40), radius: 10),
    //   degToRad(-180),
    //   degToRad(90),
    //   false,
    // );

    // path.quadraticBezierTo(
    //   size.width / 4,
    //   0,
    //   size.width / 2,
    //   0,
    // );
    // path.quadraticBezierTo(
    //   size.width / 4,
    //   0,
    //   size.width / 4,
    //   0,
    // );

    path.arcTo(
      Rect.fromCircle(
        center:
            Offset(test0 + selectedButtonWidth / 2, selectedButtonWidth / 2),
        radius: 29,
      ),
      degToRad(-202),
      degToRad(-158),
      false,
    );

    path.arcTo(
      Rect.fromCircle(
        center:
            Offset(test1 + selectedButtonWidth / 2, selectedButtonWidth / 2),
        radius: 29,
      ),
      degToRad(-180),
      degToRad(-180),
      false,
    );

    path.arcTo(
      Rect.fromCircle(
        center:
            Offset(test2 + selectedButtonWidth / 2, selectedButtonWidth / 2),
        radius: 29,
      ),
      degToRad(-180),
      degToRad(-180),
      false,
    );

    path.arcTo(
      Rect.fromCircle(
        center:
            Offset(test3 + selectedButtonWidth / 2, selectedButtonWidth / 2),
        radius: 29,
      ),
      degToRad(-180),
      degToRad(-180),
      false,
    );

    //path.lineTo(size.width / 2, initMargin);

    // path.quadraticBezierTo(
    //   0.75 * size.width,
    //   initMargin,
    //   size.width - 10,
    //   initMargin + 28,
    // );

    // path.arcTo(
    //   Rect.fromCircle(
    //       center: Offset(size.width - 10, initMargin + 40), radius: 10),
    //   degToRad(-70),
    //   degToRad(90),
    //   false,
    // );

    path.lineTo(size.width, initMargin + 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }
}

class SelectedButton extends StatelessWidget {
  const SelectedButton({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Ink(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            gradient: LinearGradient(colors: [
              Color(0xFF4868F1),
              Color(0xFF8F7BF8),
            ]),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
