import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/core/app_colors.dart';

class NavItemWidget extends StatelessWidget{

  final String assetName;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItemWidget({
    super.key,
    required this.assetName,
    required this.label,
    required this.isSelected,
    required this.onTap,
});

  @override
  Widget build(BuildContext context){
    final Color activeColor = AppColors.nochigimaColor;
    final Color inactiveColor = Colors.grey[300]!;

    return Expanded(child: InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                  isSelected ? activeColor : inactiveColor,
                  BlendMode.srcIn),
            ),

          const SizedBox(height: 6),
          Text(
              label,
              style:TextStyle(
                color: isSelected
                    ? activeColor : inactiveColor, fontSize: 12,
              ),
          ),

          ],
        ),
      ),
    ),
    );
  }
}
