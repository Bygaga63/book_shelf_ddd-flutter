import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('PublishDate', () {
    test('shout return failure when date is not formatted properly', () async {
      //arrange
      var date = PublishDate.create('2019.01.20')
          .fold((err) => err, (publishDate) => publishDate);
      //act

      //assert
      expect(date, matcher.TypeMatcher<Failure>());
    });

    test('should set date when date is valid', () {
      //arrange
      final pDate = '2019-01-20';
      var date = PublishDate.create(pDate).getOrElse(null);
      //assert
      expect(date.toDate(), DateTime(2019, 01, 20));
    });
  });
}
