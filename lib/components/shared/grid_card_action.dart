import 'package:flutter/material.dart';

class GridCardAction extends StatefulWidget {
  const GridCardAction(
      {super.key,
      required this.icon,
      this.hoverColor = Colors.white54,
      this.iconColor});

  final IconData icon;
  final Color? hoverColor;
  final Color? iconColor;

  @override
  State<GridCardAction> createState() => _GridCardActionState();
}

class _GridCardActionState extends State<GridCardAction> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
        ),
      ),
    );
  }
}
