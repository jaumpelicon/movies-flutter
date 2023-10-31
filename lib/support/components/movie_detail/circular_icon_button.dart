import 'package:flutter/material.dart';

import '../../styles/application_colors.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function()? onTap;

  const CircularIconButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ApplicationColors.black,
        ),
        child: Icon(
          icon,
          size: 22,
          color: isSelected ? ApplicationColors.green1 : ApplicationColors.white,
        ),
      ),
    );
  }
}
