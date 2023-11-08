// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf63c51),
      appBar: AppBar(
        backgroundColor: Color(0xFFf63c51),
        title: Text(
          "Food_Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "shopping_cart");
              },
            ),
          ),
        ],
      ),
    );
  }
}
