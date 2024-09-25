import 'package:flutter_bloc/flutter_bloc.dart';

class UserTypeCubit extends Cubit<UserType> {
  UserTypeCubit() : super(UserType.restaurant);

  void selectRestaurant() {
    emit(UserType.restaurant);
  }

  void selectEmployer() {
    emit(UserType.employer);
  }
}

enum UserType {
  restaurant,
  employer,
}
