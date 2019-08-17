import 'package:flutter/material.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(),
              ),
            );
          },
          child: Hero(
            tag: "app",
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
