import 'dart:math';

import 'package:cosmic/views/favorites/favorites.dart';
import 'package:cosmic/views/planet_details/planet_details.dart';
import 'package:cosmic/views/profile/accounts.dart';
import 'package:flutter/material.dart';
import 'package:cosmic/planets_data/planets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/home/home.png"), fit: BoxFit.fill)),
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {},
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              selectedItemColor: const Color.fromARGB(255, 20, 67, 88),
              currentIndex: 0,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                    tooltip: "Home",
                    icon: Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 120, 191, 224),
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    tooltip: "Favourites",
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                    ),
                    label: "Favourites"),
                BottomNavigationBarItem(
                    tooltip: "More",
                    icon: Icon(
                      Icons.more_horiz,
                      color: Color.fromARGB(255, 213, 220, 223),
                    ),
                    label: "More"),
              ],
              backgroundColor: Colors.transparent,
            ),
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Accounts()));
                            },
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ))),
                  )
                ],
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Milky way",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      "Solar System",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                )),
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                const Divider(
                  thickness: 1,
                ),
                Container(
                    height: 70,
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: buildPlanetCard,
                      scrollDirection: Axis.horizontal,
                    )),
                planetOftheDay(context),
                solarInfor(context)
              ],
            )));
  }

  Widget planetOftheDay(BuildContext context) {
    Planet rndPlanet =
        Server.getPlanetById((Random().nextInt(8) + 1).toString());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 0, 1, 2).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
            color: Colors.transparent,
            border:
                Border.all(color: Color.fromARGB(255, 10, 14, 46), width: 0.5),
            borderRadius: BorderRadius.circular(28),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Planet of the day",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: rndPlanet.planetImage,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rndPlanet.name,
                        style: const TextStyle(
                            fontFamily: "Figtree",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 39, 167, 156)),
                      ),
                      Text(
                        rndPlanet.overView,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 247, 244, 244),
                            fontSize: 12),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          children: [
                            const Text(
                              "Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                                splashColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlanetDetails(),
                                          settings: RouteSettings(arguments: {
                                            "planet": rndPlanet
                                          })));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromARGB(255, 67, 186, 223),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ).animate().scale(duration: 1.seconds),
      ),
    );
  }
}

Widget solarInfor(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Card(
      color: Colors.transparent,
      shadowColor: Colors.black,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 0, 1, 2).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          color: Colors.transparent,
          border:
              Border.all(color: Color.fromARGB(255, 13, 27, 37), width: 0.5),
          borderRadius: BorderRadius.circular(28),
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Solar System",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "The Solar System[c] is the gravitationally bound system of the Sun and the objects that orbit it. It formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud. The vast majority (99.86%) of the system's mass is in the Sun, with most of the remaining mass contained in the planet Jupiter. The four inner system planets—Mercury, Venus, Earth and Mars—are terrestrial planets, being composed primarily of rock and metal. The four giant planets of the outer system are substantially larger and more massive than the terrestrials.",
              softWrap: true,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 12),
            )
          ]),
        ),
      ),
    ),
  );
}

Widget buildPlanetCard(context, int index) {
  Planet planet = Server.getPlanetById((index + 1).toString());

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlanetDetails(),
            settings: RouteSettings(arguments: {"planet": planet})),
      );
    },
    child: Ink(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Card(
          borderOnForeground: false,
          elevation: 10,
          color: const Color.fromARGB(0, 56, 34, 117),
          child: AnimatedContainer(
            duration: Duration(seconds: 1000),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color:
                        const Color.fromARGB(255, 15, 15, 15).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3))
              ],
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: planet.planetImage,
                  ),
                  Text(planet.name),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
