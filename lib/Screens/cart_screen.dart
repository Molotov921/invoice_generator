import 'package:flutter/material.dart';
import 'package:invoice_generator/util.dart';
import 'invoice.dart';
import 'menu_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0;

  @override
  void initState() {
    super.initState();
    for (Map map in cartList) {
      total += map["price"] as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.all(36),
                  child: Text(
                    "Shopping \nCart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return MenuItem(
                map: cartList.elementAt(index - 1),
                showAddButton: false,
              );
            },
            itemCount: cartList.length + 1,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.white),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Text(
                  "Total : $total\$",
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvoiceTemplate(
                          total: total,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
