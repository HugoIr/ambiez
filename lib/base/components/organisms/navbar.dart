import 'dart:ui';

import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 12,
            right: 60,
            bottom: 12,
            // top: 12,
          ),
          padding:
              const EdgeInsets.only(top: 9, bottom: 9, left: 14, right: 34),
          decoration: BoxDecoration(
            color: AmbiezColorsFoundation.bgLightGray.withOpacity(0.975),
            // gradient: RadialGradient(
            //   center: Alignment(0, 0), // near the top right
            //   radius: 0.8,
            //   // focalRadius: 20,
            //   colors: <Color>[
            //     Color(0xFFFFFF00), // yellow sun
            //     Color(0xFF0099FF), // blue sky
            //   ],
            //   stops: <double>[0.0, 1.0],
            // ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            gap: 8,
            haptic: false,
            padding: const EdgeInsets.all(AmbiezSpacingFoundation.spaceNormal),
            rippleColor: Colors.grey[200]!,
            hoverColor: Colors.grey[100]!,
            iconSize: 30,
            duration: const Duration(milliseconds: 500),
            color: Colors.grey[600],
            activeColor: AmbiezColorsFoundation.bgBlack,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.timer,
                text: 'Timer',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ],
          ),
        ),
        Positioned(
            right: 20,
            top: 8,
            child: SizedBox(
              width: 62,
              height: 62,
              child: FittedBox(
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  backgroundColor: AmbiezColorsFoundation.bgBlack,
                  child: const Icon(
                    Icons.add,
                    size: 28,
                  ),
                  onPressed: () {},
                ),
              ),
            ))
      ],
    );
  }
}
