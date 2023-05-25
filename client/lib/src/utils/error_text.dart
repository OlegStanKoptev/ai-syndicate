import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String? text;
  final Object? error;
  final StackTrace? stackTrace;
  final bool? centered;
  const ErrorText({
    super.key,
    this.text,
    this.error,
    this.stackTrace,
    this.centered,
  });

  @override
  Widget build(BuildContext context) {
    final widget = Text(
      // text ?? (kDebugMode ? '$error\n$stackTrace' : 'Unknown error'),
      text ?? '$error\n$stackTrace',
      style: const TextStyle(color: Colors.red),
    );
    if (centered ?? false) {
      return Center(child: widget);
    }
    return widget;
  }
}
