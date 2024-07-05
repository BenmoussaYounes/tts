import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text(text, style: Theme.of(context).textTheme.bodyLarge)),
        ),
      ),
    );
  }
}
