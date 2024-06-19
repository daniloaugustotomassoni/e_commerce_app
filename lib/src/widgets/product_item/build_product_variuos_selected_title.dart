import 'package:flutter/material.dart';
class BuildProductVariousSelectedTitle extends StatefulWidget {
  final String title;
  const BuildProductVariousSelectedTitle({super.key, required this.title});

  @override
  State<BuildProductVariousSelectedTitle> createState() => _BuildProductVariousSelectedTitleState();
}

class _BuildProductVariousSelectedTitleState extends State<BuildProductVariousSelectedTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title,style: const TextStyle(fontWeight: FontWeight.w900),);
  }
}
