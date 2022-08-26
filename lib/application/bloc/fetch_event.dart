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

class FetchCategory extends FetchEvent {
  final DataType dataType;
  final String? id;
  FetchCategory({
    required this.dataType,
    this.id,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FetchCategory &&
        other.dataType == dataType &&
        other.id == id;
  }

  @override
  int get hashCode => dataType.hashCode ^ id.hashCode;
}

class SearchByCategory extends FetchEvent {
  final List<String> ids;
  SearchByCategory({
    required this.ids,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchByCategory && listEquals(other.ids, ids);
  }

  @override
  int get hashCode => ids.hashCode;
}
