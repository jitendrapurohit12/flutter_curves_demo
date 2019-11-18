import 'package:flutter/material.dart';
import 'package:flutter_curves_demo/models/dish.dart';
import 'package:flutter_curves_demo/pages/secondary_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 96),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 24,
                  ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 24),
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Healthy ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'Food',
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 3 / 2,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Dish dish = list[index];
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondaryPage(
                                      dish: dish,
                                    ))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Hero(
                              tag: dish.name,
                              child: Image.asset(
                                dish.image,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                              ),
                            ),
                            title: Text(dish.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                            subtitle: Text('\$${dish.price}'),
                            trailing: Icon(Icons.add,
                                color:
                                    Theme.of(context).textTheme.headline.color),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 16.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color:
                                    Theme.of(context).textTheme.subtitle.color),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color:
                                    Theme.of(context).textTheme.subtitle.color),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.card_travel),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline
                                        .color),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 14),
                                child: Center(
                                  child: Text('Checkout',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor)),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
