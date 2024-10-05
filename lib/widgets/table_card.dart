import 'package:chapacosales/models/table_state.dart';
import 'package:flutter/material.dart';

class TableCard extends StatefulWidget {
  final String title;
  final TableState tableState;
  final VoidCallback? onTap;

  const TableCard({
    super.key,
    required this.title,
    required this.tableState,
    this.onTap,
  });

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.tableState == TableState.disabled) {
      return Card(
        color: widget.tableState.backgroundColor(context),
        elevation: 0,
      );
    }

    return Card(
      color: widget.tableState.backgroundColor(context),
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
            Text(widget.tableState.name)
          ],
        ),
      ),
    );
  }
}
