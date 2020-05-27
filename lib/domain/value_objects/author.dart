import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

class Author extends Equatable {
  final String value;

  Author._(this.value);

  static Either<Failure, Author> create(String value) {
    if (value == null || value.isEmpty) {
      return left(Failure('author name should not be empty'));
    }
    return right(Author._(value));
  }

  @override
  List<Object> get props => [value];
}
