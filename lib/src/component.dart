import 'package:flutter/material.dart';

class Availability extends StatelessWidget {
  final bool available;
  final WidgetBuilder childBuilder;
  final WidgetBuilder? elseBuilder;

  Availability({
    required this.available,
    required this.childBuilder,
    this.elseBuilder,
  });

  Widget build(BuildContext context) {
    if (!available) {
      return elseBuilder != null ? elseBuilder!(context) : SizedBox.shrink();
    }
    return childBuilder(context);
  }
}
