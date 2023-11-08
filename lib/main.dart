// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'Screens/cart_screen.dart';
import 'Screens/menu_screen.dart';
import 'package:invoice_generator/util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryName;
  bool cart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf63c51),
      appBar: AppBar(
        backgroundColor: Color(0xFFf63c51),
        title: Text(
          categoryName == null && !cart ? "Food" : "",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  cart = true;
                });
              },
              child: Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
        leading: categoryName == null && !cart
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ))
            : IconButton(
                onPressed: () {
                  setState(() {
                    categoryName = null;
                    cart = false;
                  });
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
      ),
      body: categoryName == null && !cart
          ? Column(
              children: FoodList.map((e) {
                return FoodDetail(
                  map: e,
                  onTapBlock: () {
                    setState(() {
                      categoryName = e['cat_name'];
                    });
                  },
                );
              }).toList(),
            )
          : cart
              ? CartScreen()
              : MenuScreen(catName: categoryName!),
    );
  }
}

class FoodDetail extends StatefulWidget {
  Map? map;
  void Function() onTapBlock;

  FoodDetail({super.key, this.map, required this.onTapBlock});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: GestureDetector(
        onTap: widget.onTapBlock,
        child: Container(
          height: 120,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(
                  widget.map?["cat_image"],
                ),
                radius: 40,
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.map?["cat_name"],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
