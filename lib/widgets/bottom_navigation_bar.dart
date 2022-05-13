import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    return TextButton(
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
    );
  }
}
