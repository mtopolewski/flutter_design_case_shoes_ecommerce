import 'package:flutter/material.dart';

class LargeCard extends StatelessWidget {
  const LargeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(14),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "NIke",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "50% OFF",
                      style: TextStyle(
                        fontFamily: 'CoreSans',
                        fontSize: 20,
                        wordSpacing: -1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Amazing deal here",
                      style: TextStyle(
                        fontFamily: 'CoreSans',
                        wordSpacing: -1,
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 130,
                    width: 180,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: CustomPaint(
                            painter: OpenPainter(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/output-onlinepngtools.png",
                            width: 180,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color.fromRGBO(193, 196, 204, 0.383),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "50% RED PUMA Boys Softride",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    fontSize: 15,
                    wordSpacing: -1,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                const Text(
                  "Rift Sli On Sneaker",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    wordSpacing: -1,
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  //height: 1,
                  "We offer all of our Lay's products from the date 20.07.2021 to 27.07.2021, hurry up to get several products in cheap and tasty products",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    fontSize: 11,
                    height: 1.8,
                    wordSpacing: -1,
                    //fontWeight: FontWeight.bold,
                    color: Color(0xFFB0B0B7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff3AC3DF)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(-40, 40), 80, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
