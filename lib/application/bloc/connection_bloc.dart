import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connection_event.dart';
part 'connection_state.dart';
part 'connection_bloc.freezed.dart';

@injectable
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  @lazySingleton
  final InternetConnectionChecker _internetConnectionChecker;
  ConnectionBloc(this._internetConnectionChecker)
      : super(ConnectionState.initial()) {
    on<_Check>(_onConnectionCheck);
  }
  @override
  void onTransition(Transition<ConnectionEvent, ConnectionState> transition) {
    super.onTransition(transition);
    print(
        'Event: ${transition.event}// Current: ${transition.currentState}// NextState: ${transition.nextState}');
  }

  @override
  void onChange(Change<ConnectionState> change) {
    super.onChange(change);
    print(
        'Current bloc: ${change.currentState}// NextState: ${change.nextState}');
  }

  Future<void> _onConnectionCheck(event, Emitter<ConnectionState> emit) async {
    emit(state.copyWith(isChecking: true));
    await InternetConnectionChecker.createInstance(
            checkInterval: const Duration(seconds: 1))
        .onStatusChange
        .listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          emit(state.copyWith(
            status: ConnectionStatus.connected,
            type: ConnectionType.wifi,
            isChecking: false,
          ));
          break;
        case InternetConnectionStatus.disconnected:
          emit(state.copyWith(
            status: ConnectionStatus.disconnected,
            type: ConnectionType.none,
            isChecking: false,
          ));
          break;
      }
    }).asFuture();
  }
}
