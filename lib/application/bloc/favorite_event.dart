part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.favoriteCoursesPressed(List<String> courseIds) =
      _FavoriteCoursesPressed;
}
