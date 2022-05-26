import 'package:bezier/bezier.dart';
import 'package:case_shoes_ecommerce/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:vector_math/vector_math.dart' hide Colors;

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _selectedIndex = 0;
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

    _onButtonClick(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Stack(
      children: [
        ClipPath(
          clipper: BottomMenuClipper(_selectedIndex),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3858DA),
                  Color(0xFF8C78EF),
                ],
              ),
            ),
            height: 160,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BottomBarButton(
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    text: "Saved",
                    isSelected: _selectedIndex == 0,
                    onTap: () {
                      _onButtonClick(0);
                    },
                  ),
                  BottomBarButton(
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    text: "Home",
                    isSelected: _selectedIndex == 1,
                    onTap: () {
                      _onButtonClick(1);
                    },
                  ),
                  BottomBarButton(
                    icon: Column(
                      children: const [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    text: "My Order",
                    isSelected: _selectedIndex == 2,
                    onTap: () {
                      _onButtonClick(2);
                    },
                  ),
                  BottomBarButton(
                    icon: const Icon(
                      Icons.person_outlined,
                      color: Colors.white,
                    ),
                    text: "Profile",
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      _onButtonClick(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: _selectedIndex == 0,
          child: Positioned(
            top: 26,
            left: test0,
            child: const SelectedButton(
              icon: Icons.favorite_outline,
            ),
          ),
        ),
        Visibility(
          visible: _selectedIndex == 1,
          child: Positioned(
            top: 6,
            left: test1,
            child: const SelectedButton(icon: Icons.home_outlined),
          ),
        ),
        Visibility(
          visible: _selectedIndex == 2,
          child: Positioned(
            top: 6,
            left: test2,
            child: const SelectedButton(
              icon: Icons.shopping_cart_outlined,
            ),
          ),
        ),
        Visibility(
          visible: _selectedIndex == 3,
          child: Positioned(
            top: 22,
            left: test3,
            child: const SelectedButton(icon: Icons.person_outlined),
          ),
        ),
      ],
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        onTap: isSelected ? null : onTap,
        hoverColor:
            isSelected ? Colors.transparent : Theme.of(context).hoverColor,
        child: Ink(
          decoration: const BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          width: 56,
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: !isSelected,
                replacement: const SizedBox(height: 20),
                child: icon,
              ),
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
  BottomMenuClipper(this._selectedIndex);
  final int _selectedIndex;
  @override
  Path getClip(Size size) => _getPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  double degToRad(num deg) => deg * (math.pi / 180.0);
  num radToDeg(double rad) => rad * 180.0 / math.pi;

  Path _getPath(Size size) {
    const buttonWidth = 56;
    var remainingSpace = size.width - 4 * buttonWidth;
    var spaceBetween = remainingSpace / 5;
    var yDeviation = 40.0;
    var yOffset = 30.0;
    var cornerDiameter = 10.0;

    var path = Path();
    path.moveTo(0, yDeviation + yOffset + cornerDiameter);
    // path.arcTo(
    //   Rect.fromLTRB(
    //     0,
    //     yDeviation,
    //     2 * cornerDiameter,
    //     yDeviation + 2 * cornerDiameter,
    //   ),
    //   -180.toRad(),
    //   60.toRad(),
    //   false,
    // );

    final firstHalfCurve = QuadraticBezier([
      Vector2(path.getBounds().right, path.getBounds().top),
      Vector2(size.width / 4, yOffset),
      Vector2(size.width / 2, yOffset)
    ]);

    final secondHalfCurve = QuadraticBezier([
      Vector2(size.width * 0.5, yOffset),
      Vector2(size.width * 0.75, yOffset),
      Vector2(size.width, /* - cornerDiameter + 4,*/ yDeviation + yOffset)
    ]);

    if (_selectedIndex == 0) {
      var subCurve0Perc0 = 0.0;
      var subCurve0Perc1 = spaceBetween / (size.width * 0.5);
      var subCurve0 = firstHalfCurve.subcurveBetween(
        subCurve0Perc0,
        subCurve0Perc1,
      );

      path.quadraticBezierTo(subCurve0.points[1].r, subCurve0.points[1].g,
          subCurve0.points[2].r, subCurve0.points[2].g);
      var c0 = firstHalfCurve
          .pointAt((spaceBetween + buttonWidth * 0.5) / (size.width * 0.5));
      var p0 = subCurve0.points[2];
      var p1 = firstHalfCurve
          .pointAt((spaceBetween + buttonWidth) / (size.width * 0.5));

      var tgAlpha0 = (c0.r - p0.r) / (p0.g - c0.g);
      var alpha0 = math.atan(tgAlpha0).toDeg();

      var tgBeta0 = (c0.g - p1.g) / (p1.r - c0.r);
      var beta0 = math.atan(tgBeta0).toDeg();
      path.arcTo(
        Rect.fromCircle(
          center: Offset(c0.r, c0.g),
          radius: buttonWidth / 2,
        ),
        (alpha0 + 90).toRad(),
        -(alpha0 + beta0 + 90).toRad(),
        false,
      );

      // path.quadraticBezierTo(
      //   3 * size.width / 4,
      //   0,
      //   size.width - 1 * cornerDiameter + 4,
      //   yOffset,
      // );

      var subCurve1Perc0 = p1.r / (size.width * 0.5);
      var subCurve1Perc1 = 1.0;
      var subCurve1 = firstHalfCurve.subcurveBetween(
        subCurve1Perc0,
        subCurve1Perc1,
      );

      path.quadraticBezierTo(
        subCurve1.points[1].r,
        subCurve1.points[1].g,
        subCurve1.points[2].r, //size.width - 1 * cornerDiameter + 4,
        subCurve1.points[2].g,
      );

      path.quadraticBezierTo(
        size.width * 0.75,
        0 + yOffset,
        size.width, //size.width - 1 * cornerDiameter + 4,
        yDeviation + yOffset,
      );
    }

    if (_selectedIndex == 1) {
      var subCurve0Perc0 = 0.0; //p1.r / size.width * 0.5;
      var subCurve0Perc1 =
          (2 * spaceBetween + buttonWidth) / (size.width * 0.5);
      var subCurve0 = firstHalfCurve.subcurveBetween(
        subCurve0Perc0,
        subCurve0Perc1,
      );

      path.quadraticBezierTo(
        subCurve0.points[1].r,
        subCurve0.points[1].g,
        subCurve0.points[2].r, //size.width - 1 * cornerDiameter + 4,
        subCurve0.points[2].g,
      );

      var p1 = firstHalfCurve
          .pointAt((spaceBetween + buttonWidth) / (size.width / 2));
      var subCurve1Perc0 = (p1.r) / (size.width / 2);
      var subCurve1Perc1 =
          (spaceBetween + buttonWidth + spaceBetween) / (size.width / 2);
      var subCurve1 =
          firstHalfCurve.subcurveBetween(subCurve1Perc0, subCurve1Perc1);

      // path.quadraticBezierTo(subCurve1.points[1].r, subCurve1.points[1].g,
      //     subCurve1.points[2].r, subCurve1.points[2].g);

      var p2 = subCurve1.points[2];
      var c1 = firstHalfCurve.pointAt(
          (2 * spaceBetween + buttonWidth + buttonWidth / 2) /
              (size.width / 2));
      var p3 = firstHalfCurve
          .pointAt((2 * spaceBetween + 2 * buttonWidth) / (size.width / 2));

      var tgAlpha1 = (c1.r - p2.r) / (p2.g - c1.g);
      var alpha1 = math.atan(tgAlpha1).toDeg();

      var tgBeta1 = (c1.g - p3.g) / (p3.r - c1.r);
      var beta1 = math.atan(tgBeta1).toDeg();

      path.arcTo(
        Rect.fromCircle(
          center: Offset(c1.r, c1.g),
          radius: buttonWidth / 2,
        ),
        (alpha1 + 90).toRad(),
        -(alpha1 + beta1 + 90).toRad(),
        false,
      );

      var subCurve2Perc0 = (p3.r) / (size.width / 2);
      var subCurve2Perc1 =
          (2.5 * spaceBetween + 2 * buttonWidth) / (size.width / 2);
      var subCurve2 =
          firstHalfCurve.subcurveBetween(subCurve2Perc0, subCurve2Perc1);

      path.quadraticBezierTo(subCurve2.points[1].r, subCurve2.points[1].g,
          subCurve2.points[2].r, subCurve2.points[2].g);

      path.quadraticBezierTo(
        size.width * 0.75,
        0 + yOffset,
        size.width, //size.width - 1 * cornerDiameter + 4,
        yDeviation + yOffset,
      );
    }

    if (_selectedIndex == 2) {
      path.quadraticBezierTo(
        size.width * 0.25,
        yOffset,
        size.width / 2, //size.width - 1 * cornerDiameter + 4,
        yOffset,
      );

      var subCurve3Perc0 = 0.0;
      //(subCurve2.points[2].r) / (size.width / 2);
      var subCurve3Perc1 = (spaceBetween * 0.5) / (size.width / 2);
      var subCurve3 =
          secondHalfCurve.subcurveBetween(subCurve3Perc0, subCurve3Perc1);

      path.quadraticBezierTo(subCurve3.points[1].r, subCurve3.points[1].g,
          subCurve3.points[2].r, subCurve3.points[2].g);

      var p4 = subCurve3.points[2];
      var c2 = secondHalfCurve
          .pointAt((0.5 * spaceBetween + 0.5 * buttonWidth) / (size.width / 2));
      var p5 = secondHalfCurve
          .pointAt((0.5 * spaceBetween + buttonWidth) / (size.width / 2));

      var tgAlpha2 = (p5.r - c2.r) / (p5.g - c2.g);
      var alpha2 = math.atan(tgAlpha2).toDeg();

      var tgBeta2 = (c2.g - p4.g) / (c2.r - p4.r);
      var beta2 = math.atan(tgBeta2).toDeg();

      path.arcTo(
        Rect.fromCircle(
          center: Offset(c2.r, c2.g),
          radius: buttonWidth / 2,
        ),
        //(alpha2 + 90).toRad(),
        (180 + beta2).toRad(),
        -(beta2 + 90 + alpha2).toRad(),
        //-(alpha2 + beta2 + 90).toRad(),
        false,
      );

      var subCurve4Perc0 = (p5.r - size.width / 2) / (size.width / 2);
      var subCurve4Perc1 = 1.0;
      var subCurve4 =
          secondHalfCurve.subcurveBetween(subCurve4Perc0, subCurve4Perc1);

      path.quadraticBezierTo(subCurve4.points[1].r, subCurve4.points[1].g,
          subCurve4.points[2].r, subCurve4.points[2].g);
    }

    // if (_selectedIndex == 3) {
    //   path.quadraticBezierTo(
    //     size.width * 0.25,
    //     yOffset,
    //     size.width / 2, //size.width - 1 * cornerDiameter + 4,
    //     yOffset,
    //   );

    //   path.quadraticBezierTo(
    //     size.width * 0.75,
    //     0 + yOffset,
    //     size.width, //size.width - 1 * cornerDiameter + 4,
    //     yDeviation + yOffset,
    //   );
    // }

    if (_selectedIndex == 3) {
      path.quadraticBezierTo(
        size.width * 0.25,
        yOffset,
        size.width / 2, //size.width - 1 * cornerDiameter + 4,
        yOffset,
      );

      var subCurve3Perc0 = 0.0;
      //(subCurve2.points[2].r) / (size.width / 2);
      var subCurve3Perc1 =
          (spaceBetween * 1.5 + buttonWidth) / (size.width / 2);
      var subCurve3 =
          secondHalfCurve.subcurveBetween(subCurve3Perc0, subCurve3Perc1);

      path.quadraticBezierTo(subCurve3.points[1].r, subCurve3.points[1].g,
          subCurve3.points[2].r, subCurve3.points[2].g);

      var p6 = subCurve3.points[2];
      var c3 = secondHalfCurve
          .pointAt((1.5 * spaceBetween + 1.5 * buttonWidth) / (size.width / 2));
      var p7 = secondHalfCurve
          .pointAt((1.5 * spaceBetween + 2 * buttonWidth) / (size.width / 2));

      var tgAlpha3 = (p7.r - c3.r) / (p7.g - c3.g);
      var alpha3 = math.atan(tgAlpha3).toDeg();

      var tgBeta3 = (c3.g - p6.g) / (c3.r - p6.r);
      var beta3 = math.atan(tgBeta3).toDeg();

      path.arcTo(
        Rect.fromCircle(
          center: Offset(c3.r, c3.g),
          radius: buttonWidth / 2,
        ),
        (180 + beta3).toRad(),
        -(beta3 + 90 + alpha3).toRad(),
        false,
      );

      path.quadraticBezierTo(
        p7.r,
        p7.g,
        size.width, // - 1 * cornerDiameter + 4,
        yOffset + yDeviation,
      );
    }

    // var subCurve1Perc0 = (p1.r) / (size.width / 2);
    // var subCurve1Perc1 =
    //     (spaceBetween + buttonWidth + spaceBetween) / (size.width / 2);
    // var subCurve1 =
    //     firstHalfCurve.subcurveBetween(subCurve1Perc0, subCurve1Perc1);

    // path.quadraticBezierTo(subCurve1.points[1].r, subCurve1.points[1].g,
    //     subCurve1.points[2].r, subCurve1.points[2].g);

    // var p2 = subCurve1.points[2];
    // var c1 = firstHalfCurve.pointAt(
    //     (2 * spaceBetween + buttonWidth + buttonWidth / 2) / (size.width / 2));
    // var p3 = firstHalfCurve
    //     .pointAt((2 * spaceBetween + 2 * buttonWidth) / (size.width / 2));

    // var tgAlpha1 = (c1.r - p2.r) / (p2.g - c1.g);
    // var alpha1 = math.atan(tgAlpha1).toDeg();

    // var tgBeta1 = (c1.g - p3.g) / (p3.r - c1.r);
    // var beta1 = math.atan(tgBeta1).toDeg();

    // path.arcTo(
    //   Rect.fromCircle(
    //     center: Offset(c1.r, c1.g),
    //     radius: buttonWidth / 2,
    //   ),
    //   (alpha1 + 90).toRad(),
    //   -(alpha1 + beta1 + 90).toRad(),
    //   false,
    // );

    // var subCurve2Perc0 = (p3.r) / (size.width / 2);
    // var subCurve2Perc1 =
    //     (2.5 * spaceBetween + 2 * buttonWidth) / (size.width / 2);
    // var subCurve2 =
    //     firstHalfCurve.subcurveBetween(subCurve2Perc0, subCurve2Perc1);

    // path.quadraticBezierTo(subCurve2.points[1].r, subCurve2.points[1].g,
    //     subCurve2.points[2].r, subCurve2.points[2].g);

    // var subCurve3Perc0 = 0.0;
    // //(subCurve2.points[2].r) / (size.width / 2);
    // var subCurve3Perc1 = (spaceBetween * 0.5) / (size.width / 2);
    // var subCurve3 =
    //     secondHalfCurve.subcurveBetween(subCurve3Perc0, subCurve3Perc1);

    // path.quadraticBezierTo(subCurve3.points[1].r, subCurve3.points[1].g,
    //     subCurve3.points[2].r, subCurve3.points[2].g);

    // var p4 = subCurve3.points[2];
    // var c2 = secondHalfCurve
    //     .pointAt((0.5 * spaceBetween + 0.5 * buttonWidth) / (size.width / 2));
    // var p5 = secondHalfCurve
    //     .pointAt((0.5 * spaceBetween + buttonWidth) / (size.width / 2));

    // var tgAlpha2 = (p5.r - c2.r) / (p5.g - c2.g);
    // var alpha2 = math.atan(tgAlpha2).toDeg();

    // var tgBeta2 = (c2.g - p4.g) / (c2.r - p4.r);
    // var beta2 = math.atan(tgBeta2).toDeg();

    // path.arcTo(
    //   Rect.fromCircle(
    //     center: Offset(c2.r, c2.g),
    //     radius: buttonWidth / 2,
    //   ),
    //   //(alpha2 + 90).toRad(),
    //   (180 + beta2).toRad(),
    //   -(beta2 + 90 + alpha2).toRad(),
    //   //-(alpha2 + beta2 + 90).toRad(),
    //   false,
    // );

    // var subCurve4Perc0 = (p5.r - size.width / 2) / (size.width / 2);
    // var subCurve4Perc1 = (1.5 * spaceBetween + buttonWidth) / (size.width / 2);
    // var subCurve4 =
    //     secondHalfCurve.subcurveBetween(subCurve4Perc0, subCurve4Perc1);

    // path.quadraticBezierTo(subCurve4.points[1].r, subCurve4.points[1].g,
    //     subCurve4.points[2].r, subCurve4.points[2].g);

    // var p6 = subCurve4.points[2];
    // var c3 = secondHalfCurve
    //     .pointAt((1.5 * spaceBetween + 1.5 * buttonWidth) / (size.width / 2));
    // var p7 = secondHalfCurve
    //     .pointAt((1.5 * spaceBetween + 2 * buttonWidth) / (size.width / 2));

    // var tgAlpha3 = (p7.r - c3.r) / (p7.g - c3.g);
    // var alpha3 = math.atan(tgAlpha3).toDeg();

    // var tgBeta3 = (c2.g - p6.g) / (c2.r - p6.r);
    // var beta3 = math.atan(tgBeta3).toDeg();

    // path.arcTo(
    //   Rect.fromCircle(
    //     center: Offset(c3.r, c3.g),
    //     radius: buttonWidth / 2,
    //   ),
    //   //(alpha2 + 90).toRad(),
    //   (180 + beta3).toRad(),
    //   -(beta3 + 90 + alpha3).toRad(),
    //   //-(alpha2 + beta2 + 90).toRad(),
    //   false,
    // );

    // path.quadraticBezierTo(
    //   p7.r,
    //   p7.g,
    //   size.width, //size.width - 1 * cornerDiameter + 4,
    //   yDeviation + yOffset,
    // );

    // path.arcTo(
    //   Rect.fromLTRB(
    //     size.width - 2 * cornerDiameter,
    //     yDeviation,
    //     size.width,
    //     yDeviation + 2 * cornerDiameter,
    //   ),
    //   -60.toRad(),
    //   60.toRad(),
    //   false,
    // );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  Path _getPath0(Size size) {
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
    if (_selectedIndex == 0) {
      path.arcTo(
        Rect.fromCircle(
          center:
              Offset(test0 + selectedButtonWidth / 2, selectedButtonWidth / 2),
          radius: 29,
        ),
        degToRad(-202),
        degToRad(-164),
        false,
      );
    } else {
      //path.lineTo(test0, initMargin + 16);
      path.quadraticBezierTo(
        test0, //size.width / 4 - 60,
        initMargin + 10,
        test1,
        initMargin,
      );
      // path.quadraticBezierTo(
      //   size.width / 4,
      //   0,
      //   size.width / 4,
      //   0,
      // );
    }

    if (_selectedIndex == 1) {
      path.arcTo(
        Rect.fromCircle(
          center:
              Offset(test1 + selectedButtonWidth / 2, selectedButtonWidth / 2),
          radius: 29,
        ),
        degToRad(-166),
        degToRad(-230),
        false,
      );
    } else {
      // path.quadraticBezierTo(
      //   size.width / 4,
      //   initMargin + 6,
      //   size.width / 2,
      //   initMargin,
      // );
      path.quadraticBezierTo(
        3 * size.width / 8 + 20,
        6,
        size.width / 2,
        initMargin,
      );
    }

    if (_selectedIndex == 2) {
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
    } else {
      // path.quadraticBezierTo(
      //   size.width / 4,
      //   0,
      //   size.width / 2,
      //   0,
      // );
    }

    if (_selectedIndex == 3) {
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
    } else {
      path.quadraticBezierTo(
        0.75 * size.width,
        initMargin,
        size.width, //size.width - 10,
        initMargin + 40,
      );
    }

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

    //path.lineTo(size.width, initMargin + 40);
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
            size: 28,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
