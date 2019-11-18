import 'package:flutter_curves_demo/models/dish.dart';

class DishDescription {
  Dish dish = Dish();

  void increaseQty() {
    dish.quantity++;
    print('increased qty to ${dish.quantity}');
  }

  void decreaseQty() {
    dish.quantity--;
    print('decreased qty to ${dish.quantity}');
  }
}
