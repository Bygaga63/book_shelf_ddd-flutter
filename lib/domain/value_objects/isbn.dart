import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

class ISBN extends Equatable {
  final String value;

  ISBN._(this.value);

  static Either<Failure, ISBN> create(String value) {
    final isbn = ISBN._(value);
    if (isbn._isValid(value)) {
      return right(isbn);
    }
    return left(Failure('Invalid ISBN'));
  }

  _isValid(String value) {
    var regex =
        r'^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$';

    RegExp exp = RegExp(regex);
    return exp.hasMatch(value);
  }

  @override
  List<Object> get props => [value];
}
