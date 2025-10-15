import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/details/presentation/widgets/pet_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // buildSliverAppBar(context),
              SliverToBoxAdapter(child: PetDetailsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget buildSliverAppBar(BuildContext context) {
//   return SliverAppBar(
//     expandedHeight: 20,
//     stretch: true,
//     leading: const CustomBackButton(),
//     backgroundColor: Colors.transparent,
//     flexibleSpace: const FlexibleSpaceBar(centerTitle: true),
//   );
// }
