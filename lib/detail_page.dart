import 'package:flutter/material.dart';
import 'package:feast/model/food_menu.dart';

class DetailPage extends StatelessWidget{

  final FoodMenu menu;

  const DetailPage ({Key? key, required this.menu}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(menu: menu);
        } else {
          return DetailMobilePage(menu: menu);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget{
  final FoodMenu menu;

  const DetailMobilePage ({Key? key, required this.menu}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                    const FavoriteState(),
                  ],
                ),
              ),
              Expanded(
                flex: 13,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 400, // Set the desired width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              menu.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                          child: Text(
                            menu.name,
                            style: const TextStyle(fontSize: 24, fontWeight:FontWeight.bold ),
                          ),
                        ),
                      ),

                      Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                            child: Text(
                              menu.desc,
                            ),
                          )
                      )
                    ],
                  ),
                ),
              )

            ],
          )

      ),
    );
  }
}

class FavoriteState extends StatefulWidget {
  const FavoriteState({Key? key}): super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteState>{
  bool isFavorite = false;

  @override
  Widget build(BuildContext context){
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final FoodMenu menu;

  const DetailWebPage({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                    const FavoriteState(),
                  ],
                ),
            ),
            Expanded(
              flex: 13,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 600, // Set the desired width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              menu.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
                          child: Text(
                            menu.name,
                            style: const TextStyle(fontSize: 48, fontWeight:FontWeight.bold ),
                          ),
                        ),
                      ),

                      Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
                            child: Text(
                              menu.desc,
                              style: const TextStyle(fontSize: 24, fontWeight:FontWeight.normal ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
            )

          ],
        )

      ),
    );
  }
}
