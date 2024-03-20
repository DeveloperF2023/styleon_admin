import 'package:flutter/material.dart';

import '../../../core/constants/dimensions.dart';

class ContainerOfColoredStatus extends StatelessWidget {
  const ContainerOfColoredStatus({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius5)
      ),
    );
  }
}
