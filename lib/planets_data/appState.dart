import 'package:cosmic/planets_data/planets.dart';
import 'package:flutter/material.dart';

class Appstate {
  final List<String> planetList;
  final Set<Planet>? favPlanet ;

  Appstate({
    required this.planetList,
    this.favPlanet,
  });
  Appstate? copyWith({List<String>? planetList, Set<Planet>? favePlanet}) {
    return Appstate(
        planetList: planetList ?? this.planetList,
        favPlanet: favPlanet ?? favPlanet);
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope(this.data, {Key? key, required Widget child})
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
  const AppStateWidget({super.key, required this.child});
  final Widget child;

  static _AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  Appstate? _data = Appstate(planetList: Server.getPlanetList());

  void setPlanetList(List<String> newPlanetList) {
    if (newPlanetList != _data!.planetList) {
      setState(() {
        _data = _data?.copyWith(
          planetList: newPlanetList,
        );
      });
    }
  }

  void addToFavorites(Planet id) {   


    if (_data!.favPlanet==null) {
      final Set<Planet> newFavePlanets =
          Set<Planet>.from(_data?.favPlanet as Iterable);
      setState(() {
        _data = _data!.copyWith(favePlanet: newFavePlanets);
      });
    }
  }

  void removeFromCart(Planet id) {
    if (_data!.favPlanet!.contains(id)) {
      final Set<Planet> newfavPlanets =
          Set<Planet>.from(_data!.favPlanet as Iterable);
      newfavPlanets.remove(id);
      setState(() {
        _data = _data!.copyWith(
          favePlanet: newfavPlanets,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(_data!, child: widget.child);
  }
}
