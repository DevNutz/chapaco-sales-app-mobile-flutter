import 'package:flutter/material.dart';

enum LoadingState { idle, loading, success, error }

class LoadingNotifier extends ChangeNotifier {
  LoadingState _state = LoadingState.idle;
  OverlayEntry? _overlayEntry;

  final double iconSize;
  final Color successColor;
  final Color errorColor;
  final double spinnerSize;

  LoadingNotifier({
    this.iconSize = 60.0,
    this.successColor = Colors.green,
    this.errorColor = Colors.red,
    this.spinnerSize = 40.0,
  });

  LoadingState get state => _state;

  void showLoading(BuildContext context) {
    if (_state == LoadingState.loading) return;
    _state = LoadingState.loading;
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
    notifyListeners();
  }

  Future<void> showCompletionIcon({required bool isSuccess}) async {
    _state = isSuccess ? LoadingState.success : LoadingState.error;
    notifyListeners();

    _overlayEntry?.markNeedsBuild();
    await Future.delayed(const Duration(milliseconds: 666));

    hideLoading();
  }

  void hideLoading() {
    if (_state == LoadingState.idle) return;
    _state = LoadingState.idle;
    _overlayEntry?.remove();
    _overlayEntry = null;
    notifyListeners();
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: _buildIcon(context),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    switch (_state) {
      case LoadingState.loading:
        return SizedBox(
          height: spinnerSize,
          width: spinnerSize,
          child: const CircularProgressIndicator(),
        );
      case LoadingState.success:
        return Icon(Icons.check_rounded, color: successColor, size: iconSize);
      case LoadingState.error:
        return Icon(Icons.cancel_outlined, color: errorColor, size: iconSize);
      case LoadingState.idle:
      default:
        return const SizedBox.shrink();
    }
  }
}
