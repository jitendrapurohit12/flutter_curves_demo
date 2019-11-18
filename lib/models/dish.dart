import 'package:flutter_curves_demo/assets/image_paths.dart';
import 'package:flutter_curves_demo/models/dish_specs.dart';

class Dish {
  String name, image, weight;
  List<DishSpecs> specs;
  int price, quantity;

  Dish(
      {this.name,
      this.image,
      this.weight,
      this.specs,
      this.price,
      this.quantity});
}

final list = [
  Dish(
      name: 'Salmon Bowl',
      image: plate3,
      weight: '300',
      specs: [
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G', showColored: true),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G'),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
      ],
      price: 178,
      quantity: 0),
  Dish(
      name: 'Spring Bowl',
      image: plate4,
      weight: '400',
      specs: [
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G', showColored: true),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G'),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
      ],
      price: 200,
      quantity: 0),
  Dish(
      name: 'Avocado Bowl',
      image: plate3,
      weight: '500',
      specs: [
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G', showColored: true),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G'),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
      ],
      price: 300,
      quantity: 0),
  Dish(
      name: 'Berry Bowl',
      image: plate4,
      weight: '600',
      specs: [
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G', showColored: true),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
        DishSpecs(type: 'Weight', value: ['300'], unit: 'G'),
        DishSpecs(type: 'Calories', value: ['275'], unit: 'CAL'),
        DishSpecs(type: 'Vitamins', value: ['A, AB'], unit: 'VIT'),
      ],
      price: 400,
      quantity: 0),
];
