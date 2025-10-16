import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/routes/routes.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/manager/cubit/cat_state.dart';
import 'package:pet_finder_app/features/home/presentation/widgets/item_card.dart';

class ItemListview extends StatelessWidget {
  const ItemListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        log('ItemListView: Current state is ${state.runtimeType}');
        
        if (state is CatLoading) {
          log('ItemListView: Loading state');
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CatFailure) {
          log('ItemListView: Failure state - ${state.message}');

          return SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CatCubit>().getCatBreeds();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        } else if (state is CatSuccess) {
          log('ItemListView: Success state with ${state.cats.length} cats');

          return SliverList.separated(
            itemCount: state.cats.length,
            itemBuilder: (BuildContext context, int index) {
              final cat = state.cats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.detailsScreen,
                    arguments: cat,
                  );
                },
                child: ItemCard(cat: cat),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          );
        }

        log('ItemListView: Initial state - showing no data available');
        return const SliverFillRemaining(
          child: Center(child: Text('No data available')),
        );
      },
    );
  }
}
