import 'package:flutter/material.dart';

class Planet {
  String name;
  double mass;
  double gravity;
  double lengthofDay;
  double escVelocity;
  double meanTemp;
  double distFromSun;
  String overView;
  Widget planetImage;

  Planet(
      {required this.name,
      required this.mass,
      required this.gravity,
      required this.lengthofDay,
      required this.escVelocity,
      required this.meanTemp,
      required this.distFromSun,
      required this.overView,
      required this.planetImage});
}

Map<String, Planet> kDummyData = {
  "1": Planet(
      name: "Mercury",
      mass: 3.3011,
      gravity: 3.7,
      lengthofDay: 4424,
      escVelocity: 4.25,
      meanTemp: 167,
      distFromSun: 57.91,
      overView:
          "Mercury, the closest to the scorching Sun, is a sweltering world with surface temperatures that can melt lead. Named after the swift Roman messenger god, Mercury races around the Sun at incredible speeds, completing its orbit in just about 88 Earth days.",
      planetImage: Image.asset("assets/planets/planet1.png")),
  "2": Planet(
      name: "Venus",
      mass: 4.8675,
      gravity: 8.87,
      lengthofDay: 2802,
      escVelocity: 10.36,
      meanTemp: 464,
      distFromSun: 108,
      overView:
          "Venus, cloaked in thick clouds of sulfuric acid, is the brightest planet in our sky. It is a striking beauty, captivating observers throughout history. Named after the Roman goddess of love and beauty, Venus bears an atmosphere so dense that it can crush spacecraft attempting to explore its surface.",
      planetImage: Image.asset("assets/planets/planet2.png")),
  "3": Planet(
      name: "Earth",
      mass: 5.972,
      gravity: 9.81,
      lengthofDay: 24,
      escVelocity: 11.19,
      meanTemp: 15,
      distFromSun: 149.6,
      overView:
          "Earth, our precious blue planet, teeming with life and wonders. The third rock from the Sun, it's a haven for diverse ecosystems and the only known world to harbor life. From the depths of the oceans to the peaks of mighty mountains, Earth is an oasis of life amid the cosmic vastness.",
      planetImage: Image.asset("assets/planets/planet4.png")),
  "4": Planet(
      name: "Mars",
      mass: 6.4171,
      gravity: 3.71,
      lengthofDay: 24.6,
      escVelocity: 5.03,
      meanTemp: -80,
      distFromSun: 227.9,
      overView:
          "Mars, the fourth planet from the Sun, wears its nickname The Red Planet proudly. Rust-colored landscapes are adorned with massive volcanoes, enormous canyons, and evidence of ancient riverbeds. Named after the Roman god of war, Mars has been a fascination for humanity as we dream of one day setting foot on its surface.",
      planetImage: Image.asset("assets/planets/planet1.png")),
  "5": Planet(
      name: "Jupiter",
      mass: 1.898,
      gravity: 24.79,
      lengthofDay: 9.9,
      escVelocity: 59.5,
      meanTemp: -150,
      distFromSun: 778.3,
      overView:
          "Jupiter, the king of the planets, is a massive gas giant with a mesmerizing pattern of swirling clouds. Named after the mightiest Roman god, Jupiter's colossal size dominates the solar system, and its entourage of moons and its Great Red Spot make it a cosmic wonder.",
      planetImage: Image.asset("assets/planets/planet5.png")),
  "6": Planet(
      name: "Saturn",
      mass: 568.3,
      gravity: 10.44,
      lengthofDay: 10.7,
      escVelocity: 35.5,
      meanTemp: -180,
      distFromSun: 1427,
      overView:
          "Saturn, adorned with its iconic ring system, is like no other planet. Named after the Roman god of agriculture, Saturn's majestic rings are made of countless particles orbiting gracefully around the planet. It's a breathtaking sight that has inspired wonder and curiosity for generations.",
      planetImage: Image.asset("assets/planets/planet2.png")),
  "7": Planet(
      name: "Uranus",
      mass: 86.81,
      gravity: 8.68,
      lengthofDay: 17.2,
      escVelocity: 21.3,
      meanTemp: -216,
      distFromSun: 2871,
      overView:
          "Uranus, tipped on its side, rotates almost perpendicular to its orbital plane. Named after the Greek god of the sky, Uranus' pale blue hue and unique axial tilt make it a mysterious world that beckons exploration",
      planetImage: Image.asset("assets/planets/planet1.png")),
  "8": Planet(
      name: "Neptune",
      mass: 10.24,
      gravity: 11.15,
      lengthofDay: 16.1,
      escVelocity: 23.5,
      meanTemp: -214,
      distFromSun: 4498,
      overView:
          "Neptune, named after the Roman god of the sea, is a distant and enigmatic ice giant. With its vibrant azure hue, Neptune is the windiest planet in our solar system, boasting colossal storms and an elusive dark spot",
      planetImage: Image.asset("assets/planets/planet5.png"))
};

class Server {
  static Planet getPlanetById(String id) {
    return kDummyData[id]!;
  }

  static List<String> getPlanetList({String? filter}) {
    if (filter == null) return kDummyData.keys.toList();
    final List<String> ids = <String>[];
    for (final Planet planets in kDummyData.values) {
      if (planets.name.toLowerCase().contains(filter.toLowerCase())) {
        ids.add(planets.name);
      }
    }
    return ids;
  }
}
