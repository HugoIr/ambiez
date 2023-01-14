import 'package:ambiez/design/foundations/spacing.dart';
import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final bool isHorizontal;
  final double gap;
  const Space(
      {Key? key,
      this.isHorizontal = false,
      this.gap = AmbiezSpacingFoundation.spaceBetweenItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? SizedBox(width: gap) : SizedBox(height: gap);
  }
}
