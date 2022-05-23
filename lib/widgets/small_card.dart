import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    "assets/output-onlinepngtools.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFECEDEE),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0)),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 14,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "RED PUMA Boys Softride Rift Slip On Sneaker",
              style: TextStyle(
                fontFamily: 'CoreSans',
                wordSpacing: -1,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xFFEE9A2F),
                  size: 12,
                ),
                const Text(
                  "4.9",
                  style: TextStyle(
                    color: Color(0xFFEE9A2F),
                    fontSize: 10,
                    fontFamily: 'CoreSans',
                    wordSpacing: -2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: 1,
                    height: 14,
                    color: const Color(0xFFEDEEEF),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.schedule,
                    color: Color(0xFFEE9A2F),
                    size: 12,
                  ),
                ),
                const Text(
                  "18:20:00",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    wordSpacing: -1,
                    color: Color(0xFFEE9A2F),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Text(
                  "\$250.00",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    wordSpacing: -1,
                    color: Color(0xFFB3ADB5),
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Sale-10%",
                    style: TextStyle(
                      fontFamily: 'CoreSans',
                      fontWeight: FontWeight.bold,
                      wordSpacing: -1,
                      color: Color(0xFF9B9AE1),
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "\$175.00",
                  style: TextStyle(
                    fontFamily: 'CoreSans',
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              InkWell(
                customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Ink(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                        colors: [Color(0xFF4868F1), Color(0xFF8F7BF8)]),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
