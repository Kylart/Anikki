import 'package:flutter/material.dart';

class GridCardAction extends StatefulWidget {
  const GridCardAction({
    super.key,
    required this.icon,
    this.hoverColor = Colors.white54,
    this.iconColor,
    this.iconSize = 36.0,
    this.onTap,
  });

  final IconData icon;
  final Color? hoverColor;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onTap;

  @override
  State<GridCardAction> createState() => _GridCardActionState();
}

class _GridCardActionState extends State<GridCardAction> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: Container(
        width: double.infinity,
        color: isHovered ? widget.hoverColor : null,
        child: Icon(
          widget.icon,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
      ),
    );
  }
}
