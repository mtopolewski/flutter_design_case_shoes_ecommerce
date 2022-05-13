import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Ink(
        width: 46,
        height: 46,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          gradient:
              LinearGradient(colors: [Color(0xFF4868F1), Color(0xFF8F7BF8)]),
        ),
        child: const Icon(
          Icons.tune,
          color: Colors.white,
          size: 20,
        ),
      ),
      onTap: () {},
    );
  }
}
