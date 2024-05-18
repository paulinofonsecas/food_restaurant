import 'package:flutter/material.dart';
import 'package:foodly_ui/constants.dart';

import '../dot_indicators.dart';

class BigCardImageSlideScalton extends StatelessWidget {
  const BigCardImageSlideScalton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Positioned(
          bottom: kDefaultPadding,
          right: kDefaultPadding,
          child: Row(
            children: List.generate(4, (index) => const DotIndicator()),
          ),
        ),
      ],
    );
  }
}
