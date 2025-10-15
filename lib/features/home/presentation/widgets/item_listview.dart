import 'package:flutter/material.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_card.dart';

class ItemListview extends StatelessWidget {
  const ItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10);
      },
    );
  }
}
