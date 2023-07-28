import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //List of Shoe s for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Jordan",
        description:
            "The shoe that can get you anywhere anytime and without mud sticking to the soles",
        price: "255",
        imagePath: 'lib/images/shoe1.png'),
    Shoe(
        name: "Kd Jumpers",
        description:
            "The Shoe that will give you that extra jump when near the hoop",
        price: "305",
        imagePath: 'lib/images/shoe2.png'),
    Shoe(
        name: 'Air Wire',
        description:
            'If you ever want to run fater that bolt then you definately need this shoe',
        price: '1125',
        imagePath: 'lib/images/shoe3.png')
  ];

  //Get list of items in user cart
  List<Shoe> userCart = [];

  //Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //Get user cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
