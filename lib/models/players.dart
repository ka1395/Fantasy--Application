import 'package:advance_app/widgets/cartPlayer.dart';
import 'package:flutter/material.dart';

class players {
  final String id;
  final String name;
  final String location;
  final String image;
  final double value_money;
  final bool injured;
  final Color injuredColor;
  final IconData injuredIcon = Icons.health_and_safety_sharp;
  bool unselect = true;

  players(
    @required this.id,
    @required this.name,
    @required this.location,
    @required this.image,
    @required this.value_money,
    @required this.injured,
    @required this.injuredColor,
  );

  map(CartPlayer Function(dynamic playerData) param0) {}
}
