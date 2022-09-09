import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';

import '../../domain/core/cloud_failure.dart';
import '../../model/course.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IFirebaseCloud _firebaseCloud;

  SearchBloc(this._firebaseCloud) : super((SearchState.initial())) {
    on<_Searched>(_onSearched);
  }
  
  String patterConverter(String keyword) {
    return keyword[0].toUpperCase() + keyword.substring(1, keyword.length);
  }

  Future<void> _onSearched(_Searched event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
      isSearching: true,
      isLoading: true,
    ));
    await _firebaseCloud
        .searchByName(patterConverter(event.keyword))
        .then((value) {
      emit(SearchState(
        isSearching: false,
        isLoading: false,
        searchedCourses: some(value),
      ));
    });
  }

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    super.onTransition(transition);
  }
}
