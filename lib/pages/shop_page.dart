import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rangeapp/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addToCart(shoe);

    showDialog(
        context: context,
        builder: (contex) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: const Text(
                "Successfully added!",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                "Check your cart",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color
                borderRadius: const BorderRadius.all(
                    Radius.circular(12.0)), // Set the border radius
                border: Border.all(color: Colors.white), // Set the border color
              ),
              child: const TextField(
                style: TextStyle(
                    color: Colors.black), // Set the text color to black
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Colors.grey), // Set the hint text color
                  prefixIcon: Icon(Icons.search,
                      color: Colors.black), // Set the icon color
                  border: InputBorder.none, // Hide the default border
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0), // Add padding
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Created by Adetunji Olasubomi | Alx Intranet Project",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Get a shoe from shoelist
                    Shoe shoe = value.getShoeList()[index];
                    // return the shoe
                    return ShoeTile(
                      onTap: () => addShoeToCart(shoe),
                      shoe: shoe,
                    );
                  })),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
