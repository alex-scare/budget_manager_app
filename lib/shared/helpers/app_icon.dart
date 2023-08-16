import 'package:flutter/material.dart';

enum AppIcon {
  money(Icons.money),
  creditCard(Icons.credit_card),
  attachMoney(Icons.attach_money),
  home(Icons.home),
  car(Icons.directions_car),
  food(Icons.fastfood),
  shopping(Icons.shopping_cart),
  gift(Icons.card_giftcard),
  health(Icons.healing),
  education(Icons.school),
  entertainment(Icons.movie),
  travel(Icons.flight),
  other(Icons.more_horiz),
  favorite(Icons.favorite),
  ;

  const AppIcon(this.icon);

  final IconData icon;

  List<IconData> get iconList => values.map((entity) => entity.icon).toList();
}
