
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

class SearchByName extends FetchEvent {
  final String name;
  SearchByName({
    required this.name,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchByName && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class FetchFavoriteCourses extends FetchEvent {
  final List<String> ids;
  FetchFavoriteCourses({
    required this.ids,
  });
  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FetchFavoriteCourses &&
      listEquals(other.ids, ids);
  }

  @override
  int get hashCode => ids.hashCode;
}
