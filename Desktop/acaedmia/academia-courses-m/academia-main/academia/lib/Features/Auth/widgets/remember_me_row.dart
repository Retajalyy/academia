import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: value, onChanged: onChanged),
            const Text("Remember me"),
          ],
        ),
        TextButton(
          onPressed: onForgotPassword,
          child: const Text("Forgot Password?"),
        )
      ],
    );
  }
}