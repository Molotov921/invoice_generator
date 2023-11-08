// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:invoice_generator/util.dart';

class MenuScreen extends StatefulWidget {
  final String catName;
  Map map = {};
  List productList = [];

  MenuScreen({super.key, required this.catName}) {
    for (Map cat in FoodList) {
      if (cat["cat_name"] == catName) {
        map = cat;
      }
    }
    productList = map["product_list"];
  }

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(36),
            child: Text(
              widget.map["cat_name"] + "s" + "\nMenu",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        return MenuItem(map: widget.productList.elementAt(index - 1));
      },
      itemCount: widget.productList.length + 1,
    );
  }
}

class MenuItem extends StatefulWidget {
  final Map map;
  final bool showAddButton;

  const MenuItem({super.key, required this.map, this.showAddButton = true});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool added = false;

  void addItem() {
    for (Map cart in cartList) {
      if (cart["name"] == widget.map["name"]) {
        cartList.remove(cart);
        setState(() {
          added = false;
        });
        return;
      }
    }
    cartList.add(widget.map);
    setState(() {
      added = true;
    });
  }

  @override
  void initState() {
    super.initState();
    for (Map cart in cartList) {
      if (cart["name"] == widget.map["name"]) {
        added = true;
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        // height: 200,
        color: Colors.white,
        child: Row(children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              widget.map["image"],
            ),
            radius: 40,
            backgroundColor: Colors.transparent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.map["name"],
                style: const TextStyle(fontSize: 20),
              ),
              RatingBar(stars: (widget.map["rating"] as double).round()),
              Text("${widget.map["price"]} \$")
            ],
          ),
          const Spacer(),
          widget.showAddButton
              ? IconButton(
                  onPressed: () {
                    addItem();
                  },
                  icon: !added
                      ? const Icon(Icons.add)
                      : const Icon(
                          Icons.add_circle,
                          color: Colors.red,
                        ))
              : const Spacer()
        ]),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int stars;
  int maxStar = 5;

  RatingBar({super.key, required this.stars});

  @override
  Widget build(BuildContext context) {
    List<Widget> item = [];

    for (int i = 0; i < stars; i++) {
      item.add(const Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    for (int i = 0; i < maxStar - stars; i++) {
      item.add(Icon(
        Icons.star,
        color: Colors.grey[500],
      ));
    }

    return Row(
      children: item,
    );
  }
}
