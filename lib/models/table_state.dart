import 'package:flutter/material.dart';

enum TableState {
  available(
    name: 'Disponible',
    description: 'La mesa está disponible para sentarse.',
  ),
  occupied(
    name: 'Ocupada',
    description: 'La mesa está ocupada actualmente.',
  ),
  reserved(
    name: 'Reservada',
    description: 'La mesa está reservada.',
  ),
  notAvailable(
    name: 'No Disponible',
    description: 'La mesa no está disponible por alguna razón.',
  ),
  disabled(
    name: '',
    description: 'La mesa está deshabilitada.',
  );

  const TableState({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  Color backgroundColor(BuildContext context) {
    switch (this) {
      case TableState.available:
        return Theme.of(context).colorScheme.surfaceContainer;
      case TableState.occupied:
        return Colors.greenAccent[100]!;
      case TableState.reserved:
        return Colors.indigoAccent[100]!;
      case TableState.notAvailable:
        return Colors.blueGrey[300]!;
      case TableState.disabled:
        return Theme.of(context).colorScheme.surface;
    }
  }
}
