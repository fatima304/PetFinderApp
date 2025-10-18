import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import '../manager/search/search_cubit.dart';
import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchTextField(
          controller: controller,
          onSubmitted: (value) {
            context.read<SearchCubit>().searchBreed(value);
          },
          isClickable: false,
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccess) {
            return Column(
              children: [Image.network(state.result.url, height: 300)],
            );
          } else if (state is SearchNotFound) {
            return Center(
              child: Text(
                'No breed found.',
                style: AppTextStyle.font24BlackBold,
              ),
            );
          } else if (state is SearchEmpty) {
            return Center(
              child: Text(
                'Please enter a breed name.',
                style: AppTextStyle.font24BlackBold,
              ),
            );
          } else if (state is SearchFailure) {
            return Center(
              child: Text(
                'Error in Search: ${state.error}',
                style: AppTextStyle.font24BlackBold,
              ),
            );
          }
          return Center(
            child: Text(
              'Search for a breed.',
              style: AppTextStyle.font24BlackBold,
            ),
          );
        },
      ),
    );
  }
}
