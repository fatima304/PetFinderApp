import 'package:flutter/material.dart';
import 'card_details.dart';

class PetDetailsGrid extends StatelessWidget {
  const PetDetailsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> petDetails = {
      "indoor": '0',
      "adaptability": '5',
      "affection_level": '4',
      "child_friendly": '4',
      "energy_level": '3',
      "health_issues": '1',
      "intelligence": '3',
      "social_needs": '4',
      "stranger_friendly": '4',
    };

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: petDetails.entries.map((entry) {
        return CardDetails(title: entry.key, desc: entry.value);
      }).toList(),
    );
  }
}
