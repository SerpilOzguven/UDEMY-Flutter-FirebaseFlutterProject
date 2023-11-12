import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';


class LineIconsPage extends StatefulWidget {
  const LineIconsPage({super.key});

  @override
  State<LineIconsPage> createState() => _LineIconsPageState();
}

class _LineIconsPageState extends State<LineIconsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Icons'),
      ),
      body: const Center(
        child: Column(
          children: [
            const Icon(Icons.person),
            const Icon(LineIcons.user),
            LineIcon.user(),
        ],
        ),
      ),
    );
  }
}
