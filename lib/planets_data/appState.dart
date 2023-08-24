import 'package:cosmic/planets_data/planets.dart';
import 'package:flutter/material.dart';

class Appstate {
  final List<String> planetList;
  final Set<Planet> favPlanet;

  Appstate({
    required this.planetList,
    Set<Planet>? favPlanet,
  }) : favPlanet = favPlanet ?? {}; // Initialize favPlanet with an empty set if it's null

  Appstate copyWith({List<String>? planetList, Set<Planet>? favPlanet}) {
    return Appstate(
      planetList: planetList ?? this.planetList,
      favPlanet: favPlanet ?? this.favPlanet,
    );
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);
  final Appstate data;

  static Appstate of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  static _AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  late Appstate _data;

  @override
  void initState() {
    super.initState();
    _data = Appstate(planetList: Server.getPlanetList());
  }

  void setPlanetList(List<String> newPlanetList) {
    if (newPlanetList != _data.planetList) {
      setState(() {
        _data = _data.copyWith(planetList: newPlanetList);
      });
    }
  }

  void addToFavorites(Planet id) {
    Set<Planet> newFavPlanets = _data.favPlanet;
    newFavPlanets.add(id);

    setState(() {
      _data = _data.copyWith(favPlanet: newFavPlanets);
    });
  }

  void removeFromCart(Planet id) {
    Set<Planet> newFavPlanets = _data.favPlanet;
    newFavPlanets.remove(id);

    setState(() {
      _data = _data.copyWith(favPlanet: newFavPlanets);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      data: _data,
      child: widget.child,
    );
  }
}
