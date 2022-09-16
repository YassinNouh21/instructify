part of 'connection_bloc.dart';

enum ConnectionStatus { connected, disconnected }

enum ConnectionType { wifi, mobile, none }

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState({
    required ConnectionStatus status,
    required ConnectionType type,
    required bool isChecking,
  }) = _ConnectionState;
  factory ConnectionState.initial() => const ConnectionState(
        status: ConnectionStatus.disconnected,
        type: ConnectionType.none,
        isChecking: false,
      );
}
