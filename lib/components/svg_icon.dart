import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({super.key, required this.name, this.color});
  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/$name.svg',
      colorFilter: ColorFilter.mode(color??Colors.black, BlendMode.srcIn),
    );
  }
}
