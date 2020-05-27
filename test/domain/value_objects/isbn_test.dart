import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('ISBN', () {
    test('should return failure when invalid isbn', () async {
      //arrange
      var isbn = ISBN.create('8990-909').fold((err) => err, (result) => result);
      //act

      //assert
      expect(isbn, matcher.TypeMatcher<Failure>());
    });
  });

  test('shoult return isbn when value is valid isbn-10', () async {
    //arrange
    String isbn10 = 'ISBN-10: 0-596-52068-9';
    var isbn = ISBN.create(isbn10).getOrElse(null);

    //act

    //assert
    expect(isbn.value, isbn10);
  });

  test('should return isbn when value is valid isbn-13', () {
    String str = 'ISBN-13: 978-0-596-52068-7';
    var isbn = ISBN.create(str).getOrElse(null);

    expect(isbn.value, str);
  });
}
