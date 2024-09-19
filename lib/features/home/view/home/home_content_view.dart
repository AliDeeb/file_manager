import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  State<HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> {
  late HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<HomeViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home view"),
    );
  }
}
