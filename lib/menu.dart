import 'package:feast/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:feast/model/food_menu.dart';


class Menu extends StatelessWidget {
  const Menu({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return MenuMobile();
          }  else {
            return const MenuWebPage();
          }
        },
      ),
    );
  }
}

class MenuMobile extends StatelessWidget {
  const MenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child:  Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/logo.jpg'),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'What should I eat today??',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Appetizer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              final FoodMenu appt = appetizerList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return DetailPage(menu: appt);
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            appt.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        appt.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: appetizerList.length,
                          ),
                        ),
                      const Text(
                        'Main Course',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                       SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              final FoodMenu mainCourse = mainCourseList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return DetailPage(menu: mainCourse);
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            mainCourse.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        mainCourse.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: mainCourseList.length,
                          ),
                        ),
                    ],
                  ),
                ))
            // Add your other widgets here...
          ],
        ),

    );
  }
}

class MenuWebPage extends StatefulWidget {
  const MenuWebPage({Key? key}) : super(key: key);

  @override
  _MenuWebPageState createState() => _MenuWebPageState();
}

class _MenuWebPageState extends State<MenuWebPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Transform.scale(
                        scale: 8.0,
                        child: Image.asset(
                          'images/logoWeb.jpg',
                          width: 1600,  // Set the desired width
                          height: 200, // Set the desired height
                          fit: BoxFit.contain, // Adjust the fit property according to your requirements
                        ),
                      )

                    ),
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'What should I eat today??',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Appetizer'),
                      Tab(text: 'Main Course'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        GridView.count(
                          crossAxisCount: 4,
                          children: appetizerList.map((menu) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailPage(menu: menu);
                                  }),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 220,
                                      height: 220,
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
                                    Text(
                                      menu.name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        GridView.count(
                          crossAxisCount: 4,
                          children: mainCourseList.map((menu) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailPage(menu: menu);
                                  }),
                                );
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 220,
                                        height: 220,
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
                                      Text(
                                        menu.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

