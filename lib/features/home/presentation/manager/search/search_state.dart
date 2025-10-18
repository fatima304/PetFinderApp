// lib/features/home/presentation/manager/search/search_state.dart
part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchImageModel result;
  SearchSuccess(this.result);
}

class SearchNotFound extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchFailure extends SearchState {
  final String error;
  SearchFailure(this.error);
}
