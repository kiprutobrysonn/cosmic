import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../planets_data/planets.dart';

class PlanetDetails extends StatefulWidget {
  const PlanetDetails({super.key});

  @override
  State<PlanetDetails> createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final recieved = ModalRoute.of(context)!.settings.arguments as Map;
    Planet planet = recieved["planet"];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/details/planetDetails.png"),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: const BoxDecoration(
            backgroundBlendMode: BlendMode.modulate,
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 230, 243),
              Color.fromARGB(255, 115, 166, 166),
              Color.fromARGB(255, 232, 97, 255)
            ], stops: [
              0.0,
              0.51,
              1.00,
            ], begin: Alignment(0.91, 0.09), end: Alignment(0.1, 0.93))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            actions: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                        color: Colors.black,
                      )
                    ],
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 11, 12))),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    isSelected: isSelected,
                    selectedIcon: const Icon(
                      Icons.favorite,
                      semanticLabel: "Like",
                      color: Color.fromARGB(255, 12, 167, 194),
                    ),
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    )),
              )
                  .animate(
                    target: isSelected ? 1 : 0,
                  )
                  .shake(duration: 1.seconds)
            ],
          ),
          body: ListView(
            children: [
              Container(
                height: 700,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                                color: const Color.fromARGB(255, 20, 2, 49),
                                width: 0.5),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 0, 1, 2)
                                      .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                  blurStyle: BlurStyle.normal)
                            ]),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Text(
                              planet.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.line_weight,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    const Text("Mass"),
                                    const Text("(10X24kg)"),
                                    Text(
                                      planet.mass.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 24),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/details/gravity.svg"),
                                    const Text("Gravity"),
                                    const Text("(m/s2)"),
                                    Text(
                                      planet.gravity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 24),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.sunny,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    const Text("Days"),
                                    const Text("(hours)"),
                                    Text(
                                      planet.lengthofDay.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 24),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                          "assets/details/escVelocity.png"),
                                      const Text("Esc Velocity"),
                                      const Text("(km/s)"),
                                      Text(
                                        planet.escVelocity.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/details/temp.svg"),
                                      const Text("Mean "),
                                      const Text("(Temp C)"),
                                      Text(
                                        planet.mass.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 24),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/details/dist.svg"),
                                      const Text("Distance from sun"),
                                      const Text("(10X6km)"),
                                      Text(
                                        planet.distFromSun.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 24),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 0, 230, 243),
                                        Color.fromARGB(255, 115, 166, 166),
                                        Color.fromARGB(255, 232, 97, 255)
                                      ],
                                      stops: [
                                        0.0,
                                        0.51,
                                        1.00,
                                      ],
                                      begin: Alignment(0.91, 0.09),
                                      end: Alignment(0.1, 0.93)),
                                ),
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    minimumSize:
                                        MaterialStatePropertyAll(Size(146, 48)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {},
                                  child: Text("Visit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(letterSpacing: 4)),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: planet.planetImage),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 1.seconds);
  }
}
