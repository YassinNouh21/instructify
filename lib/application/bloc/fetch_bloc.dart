import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';
part 'fetch_bloc.freezed.dart';

@injectable
class FetchBloc extends Bloc<FetchEvent, FetchState> {
  final IFirebaseCloud _firebaseCloud;
  final AuthenticationBloc _authenticationBloc;
  FetchBloc(this._firebaseCloud, this._authenticationBloc)
      : super(FetchState.initial()) {
    // print('fetch bloc ${hashCode}');
    on<FetchCourse>(_onFetchCourse);
    on<FetchCategory>(_onFetchCategory);
    on<SearchByCategory>(_onSearchByCategory);
    on<FetchFavoriteCourses>(_onGetFetchFavoriteCourses);
    // on<SearchByName>(_onSearchByName);
  }

  Future<void> _onFetchCourse(
      FetchEvent event, Emitter<FetchState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    await _firebaseCloud.getCourses().then((value) {
      emit(state.copyWith(
        isLoading: false,
        dataType: DataType.Course,
        failureOrSuccess: some(value),
      ));
    });
  }

  Future<void> _onFetchCategory(
      FetchCategory event, Emitter<FetchState> emit) async {
    emit(FetchState(
      true,
      none(),
      false,
      DataType.Category,
    ));
    await _firebaseCloud.getCategories().then((value) {
      // print('fetch bloc Fetched category $value');
      emit(FetchState(
        false,
        some(value),
        true,
        DataType.Category,
      ));
    });
  }

  @override
  void onTransition(Transition<FetchEvent, FetchState> transition) {
    super.onTransition(transition);
    print(
        'Event: ${transition.event}// Current: ${transition.currentState}// NextState: ${transition.nextState}');
  }

  Future<void> _onSearchByCategory(
      SearchByCategory event, Emitter<FetchState> emit) async {
    emit(FetchState(
      true,
      none(),
      false,
      DataType.Course,
    ));
    // print('fetch bloc search by category ${event.ids}');
    return await _firebaseCloud.searchByCategory(event.ids).then((value) {
      emit(FetchState(
        false,
        some(value),
        true,
        DataType.Course,
      ));
    });
  }

  // FutureOr<void> _onSearchByName(
  //     SearchByName event, Emitter<FetchState> emit) async {
  //   print('fetch bloc search by name ${event.name}');
  //   await _firebaseCloud.searchByName(event.name).then((value) {
  //     emit(FetchState(
  //       false,
  //       some(value),
  //       true,
  //       DataType.Course,
  //     ));
  //   });
  // }

  Future<void> _onGetFetchFavoriteCourses(
      FetchFavoriteCourses event, Emitter<FetchState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    if (event.ids.isEmpty || event.ids == []) {
      debugPrint('bloc favorite course is empty');
      emit(state.copyWith(
        dataType: DataType.Course,
        isLoading: false,
        failureOrSuccess: some(right([])),
        isSuccess: true,
      ));
    } else {
      await _firebaseCloud.getFavoriteCourses(event.ids).then((value) {
        debugPrint('bloc favorite course is not empty');
        emit(state.copyWith(
          dataType: DataType.Course,
          isLoading: false,
          failureOrSuccess: some(value),
          isSuccess: true,
        ));
      });
    }
  }
}
