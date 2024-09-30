import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({required this.isLoading, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent background
            child: const Center(
              child: CircularProgressIndicator(), // Loading indicator
            ),
          ),
      ],
    );
  }
}