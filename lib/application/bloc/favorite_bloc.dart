import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';
import 'package:instructify/model/course.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final IFirebaseCloud _firebaseCloud;
  final IAuthFacade _auth;
  FavoriteBloc(this._auth, this._firebaseCloud)
      : super(FavoriteState.initial()) {
    on<_FavoriteCoursesPressed>(_onFavoriteCoursesPressed);
  }

  @override
  void onTransition(Transition<FavoriteEvent, FavoriteState> transition) {
    super.onTransition(transition);
    print(
        'Event: ${transition.event}// Current: ${transition.currentState}// NextState: ${transition.nextState}');
  }

  Future<void> _onFavoriteCoursesPressed(
      _FavoriteCoursesPressed event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    if (event.courseIds.isEmpty || event.courseIds == []) {
      debugPrint('bloc favorite course is empty');
      debugPrint('bloc favorite course is ${event.courseIds}');
      emit(state.copyWith(
          isLoading: false, failureOrSuccess: some(right([])), isEmpty: true));
    } else {
      await _firebaseCloud.getFavoriteCourses(event.courseIds).then((value) {
        debugPrint('bloc favorite course is not empty');
        emit(state.copyWith(
          isLoading: false,
          failureOrSuccess: some(value),
          isEmpty: false,
        ));
      });
    }
  }
}
