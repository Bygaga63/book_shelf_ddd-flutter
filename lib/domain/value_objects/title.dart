import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Title extends Equatable {
  final String value;

  Title._(this.value);

  static Either<Failure, Title> create(String value) {
    if (value == null || value.isEmpty) {
      return left(Failure('Title cannot be empty or null'));
    }

    return right(Title._(value));
  }

  @override
  List<Object> get props => [value];
}
