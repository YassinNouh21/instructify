part of 'fetch_bloc.dart';

abstract class FetchEvent {}

class FetchCourse extends FetchEvent {
  final DataType dataType;
  final String? id;
  FetchCourse({
    required this.dataType,
    this.id,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FetchCourse && other.dataType == dataType && other.id == id;
  }

  @override
  int get hashCode => dataType.hashCode ^ id.hashCode;
}
