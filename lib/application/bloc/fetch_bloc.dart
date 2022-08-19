import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/core/cloud_failure.dart';
import 'package:instructify/domain/firebase/i_firebase_cloud.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';
part 'fetch_bloc.freezed.dart';

@injectable
class FetchBloc extends Bloc<FetchEvent, FetchState> {
  final IFirebaseCloud _firebaseCloud;

  FetchBloc(this._firebaseCloud) : super(FetchState.initial()) {
    on<FetchEvent>(_onFetchCourse);
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

  @override
  void onTransition(Transition<FetchEvent, FetchState> transition) {
    super.onTransition(transition);
    print(
        'Event: ${transition.event}// Current: ${transition.currentState}// NextState: ${transition.nextState}');
  }
}
