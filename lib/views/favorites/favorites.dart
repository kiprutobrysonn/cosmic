import 'package:cosmic/planets_data/appState.dart';
import 'package:cosmic/planets_data/planets.dart';
import 'package:cosmic/views/planet_details/planet_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
   List planets=List.from(AppStateScope.of(context).favPlanet as Iterable);

    return ListView(
      children:
      planets.map((e) => favPlanets(context, e)).toList()
      
      

    );
  }
}

 Widget favPlanets(BuildContext context,Planet planet) {    
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
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: (){
                  AppStateWidget.of(context).removeFromCart(planet);
              
        
                
                  }, icon: Icon(Icons.delete,semanticLabel:"Remove from favorites" ,)),
                ),
           
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: planet.planetImage,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.name,
                        style: const TextStyle(
                            fontFamily: "Figtree",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 39, 167, 156)),
                      ),
                      Text(
                        planet.overView,
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
                                            "planet": planet
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
        ).animate().shimmer(duration: 1.seconds),
      ),
    );
  }

