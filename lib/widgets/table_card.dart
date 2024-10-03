import 'package:flutter/material.dart';

enum CardVariant { available, occupied, reserved, notAvailable, disabled }

class TableCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final CardVariant variant;
  final VoidCallback? onTap;

  const TableCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.variant,
    this.onTap,
  });

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  Color? _getBackgroundColor(context) {
    switch (widget.variant) {
      case CardVariant.available:
        return Theme.of(context).colorScheme.surfaceContainer;
      // return Theme.of(context).colorScheme.secondary;
      case CardVariant.occupied:
        return Colors.greenAccent[100];
      case CardVariant.reserved:
        return Colors.indigoAccent[100];
      case CardVariant.notAvailable:
        return Colors.blueGrey[300];
      case CardVariant.disabled:
        return Theme.of(context).colorScheme.surface;
    }
  }

  String _getSubtitle(CardVariant variant) {
    switch (variant) {
      case CardVariant.available:
        return "Disponible";
      case CardVariant.occupied:
        return "Ocupada";
      case CardVariant.reserved:
        return "Reservada";
      case CardVariant.notAvailable:
        return "No Disponible";
      case CardVariant.disabled:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.variant == CardVariant.disabled) {
      return Card(
        color: _getBackgroundColor(context),
        elevation: 0,
      );
    }

    return Card(
      color: _getBackgroundColor(context),
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Text(_getSubtitle(widget.variant))
          ],
        ),
      ),
    );
  }
}
