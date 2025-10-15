import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/home_header.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeHeader()),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            ItemListview(),
          ],
        ),
      ),
    );
  }
}
