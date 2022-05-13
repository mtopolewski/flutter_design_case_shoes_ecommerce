import 'package:flutter/material.dart';
import 'dart:math' as Math;

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
    var path = Path();
    path.moveTo(0, 40);

    path.arcTo(
      Rect.fromCircle(center: const Offset(10, 40), radius: 10),
      degToRad(-180),
      degToRad(90),
      false,
    );

    path.quadraticBezierTo(
      size.width / 4,
      0,
      size.width / 2,
      0,
    );

    path.lineTo(size.width / 2, 0);

    path.quadraticBezierTo(
      0.75 * size.width,
      0,
      size.width - 10,
      28,
    );

    path.arcTo(
      Rect.fromCircle(center: Offset(size.width - 10, 40), radius: 10),
      degToRad(-70),
      degToRad(90),
      false,
    );

    path.lineTo(size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }
}
