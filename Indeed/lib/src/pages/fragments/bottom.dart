import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("©2022 companyName"),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            Text("Accessibility at Indeed"),
            Text("Privacy Center"),
            Text("Cookies"),
            Text("Privacy"),
            Text("Terms"),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
