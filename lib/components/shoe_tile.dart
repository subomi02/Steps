// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  void Function()? onTap;
  final Shoe shoe;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //Shoe Image
        Image.asset(shoe.imagePath),

        //Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            shoe.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    shoe.price,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            )
          ],
        )
      ]),
    );
  }
}
