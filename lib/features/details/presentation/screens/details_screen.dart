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
              SliverToBoxAdapter(child: PetDetailsSection()),
            ],
          ),
        ],
      ),
    );
  }
}

