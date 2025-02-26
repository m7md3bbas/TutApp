import 'package:tutapp/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() => this ?? Constants.empty;
}

extension NonNullInt on int? {
  int orZero() => this ?? Constants.zero;
}
