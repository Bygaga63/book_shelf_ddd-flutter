import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Title', () {
    test('should return Failure when value is empty', () async {
      //arrange
      var title = Title.create(null).fold((err) => err, (title) => title);
      //act

      //assert
      expect(title, matcher.TypeMatcher<Failure>());
    });

    test('shoulf create title when value is not empty', () async {
      var tText = 'test';
      //arrange
      var title = Title.create(tText).getOrElse(null);
      //act

      //assert
      expect(title.value, tText);
    });
  });
}
