import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('author', () {
    test('should return failure when empty', () async {
      //arrange
      var author = Author.create('').fold((err) => err, (author) => author);
      //act

      //assert
      expect(author, matcher.TypeMatcher<Failure>());
    });

    test('should return author name', () async {
      //arrange
      String tName = 'Bob';
      var author = Author.create(tName).getOrElse(null);
      //act

      //assert
      expect(author.value, tName);
    });
  });
}
