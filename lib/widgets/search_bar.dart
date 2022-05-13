import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        labelText: "Search Stores",
        labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 14, top: 0, bottom: 0, right: 10),
          child: Icon(
            CupertinoIcons.search,
            size: 22,
            color: Color(0x6E9E9E9E),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x6E9E9E9E), width: 1.6),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x6E9E9E9E), width: 1.6),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
    );
  }
}
