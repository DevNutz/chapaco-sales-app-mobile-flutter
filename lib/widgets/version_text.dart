import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionText extends StatefulWidget {
  const VersionText({super.key});

  @override
  State<VersionText> createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = 'v${packageInfo.version}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      appVersion,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 14.0,
        height: 20.0 / 14.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: Color(0xFFE8E2D4),
      ),
    );
  }
}
