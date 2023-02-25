import 'package:flutter/material.dart';

class EntryCardAction extends StatefulWidget {
  const EntryCardAction({
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
  State<EntryCardAction> createState() => _EntryCardActionState();
}

class _EntryCardActionState extends State<EntryCardAction> {
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
