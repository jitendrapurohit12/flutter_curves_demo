import 'package:flutter/material.dart';
import 'package:flutter_curves_demo/models/dish.dart';
import 'package:flutter_curves_demo/models/dish_description.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SecondaryPage extends StatelessWidget {
  final Dish dish;

  const SecondaryPage({this.dish});

  @override
  Widget build(BuildContext context) {
    var descriptionSnapshot = Injector.getAsModel<DishDescription>();
    dish.quantity = 1;
    descriptionSnapshot.setState((desc) => desc.dish = dish);

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, top: 96),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print(descriptionSnapshot.state.dish.quantity);
                    descriptionSnapshot.setState((st) => st.increaseQty());
                    print(descriptionSnapshot.state.dish.quantity);
                  },
                ),
                Text('Details',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 42),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                        color: Theme.of(context).scaffoldBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.headline,
                                children: [
                                  TextSpan(
                                      text: descriptionSnapshot.state.dish.name
                                              .split(' ')[0] +
                                          ' ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: descriptionSnapshot.state.dish.name
                                        .split(' ')[1],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '\$' +
                                    (descriptionSnapshot.state.dish.price *
                                            descriptionSnapshot
                                                .state.dish.quantity)
                                        .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .display3
                                    .copyWith(fontSize: 18),
                              ),
                              Spacer(),
                              SizedBox(
                                height: 36,
                                child: VerticalDivider(
                                  width: 4,
                                  color: Colors.grey,
                                  thickness: 1.5,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.shade100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    GestureDetector(
                                        onTap: () =>
                                            descriptionSnapshot.setState(
                                                (dish) => dish.decreaseQty()),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      descriptionSnapshot.state.dish.quantity
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                        onTap: () =>
                                            descriptionSnapshot.setState(
                                                (dish) => dish.increaseQty()),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                color:
                                                    Colors.blueAccent.shade100,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                descriptionSnapshot.state.dish.specs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var spec =
                                  descriptionSnapshot.state.dish.specs[index];
                              return Container(
                                margin: EdgeInsets.only(top: 8, left: 16),
                                width: 90,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                decoration: BoxDecoration(
                                    color: spec.showColored
                                        ? Colors.blueAccent.shade100
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                        width: 1,
                                        color: spec.showColored
                                            ? Colors.blueAccent.shade100
                                            : Colors.grey)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      spec.type.toUpperCase(),
                                      style: spec.showColored
                                          ? Theme.of(context)
                                              .textTheme
                                              .display3
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10)
                                          : Theme.of(context)
                                              .textTheme
                                              .display3
                                              .copyWith(fontSize: 10),
                                    ),
                                    Spacer(),
                                    RichText(
                                      text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline,
                                          children: [
                                            TextSpan(
                                              text: spec.value
                                                      .toString()
                                                      .substring(
                                                          1,
                                                          spec.value
                                                                  .toString()
                                                                  .length -
                                                              1) +
                                                  '\n',
                                              style: spec.showColored
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .headline
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .headline
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text: spec.unit,
                                              style: spec.showColored
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .display3
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10)
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .display3
                                                      .copyWith(fontSize: 10),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Theme.of(context).textTheme.headline.color,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36))),
                          child: Center(
                            child: Text(
                              'Proceed'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -30,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      descriptionSnapshot.state.dish.image,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
