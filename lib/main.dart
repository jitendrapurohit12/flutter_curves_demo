import 'package:flutter/material.dart';
import 'package:flutter_curves_demo/pages/landing_page.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/dish_description.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject<DishDescription>(() => DishDescription())],
      builder: (contedxt, _) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: LandingPage(),
      ),
    );
  }
}
