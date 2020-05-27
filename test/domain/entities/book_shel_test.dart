import 'package:bookdddflutter/domain/domain_exception.dart';
import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  BookShelf sut;

  setUp(() {
    sut = BookShelf(id: Identity.fromString('aaa'));
  });
  group('BookShelf', () {
    test(
        'addBook should throw DomainExeption when bookshelf exceeds its capacity',
        () async {
      //act
      List.generate(10, (ids) => Book()).forEach((book) => sut.addBook(book));
      //assert
      expect(() => sut.addBook(Book()),
          throwsA(matcher.TypeMatcher<DomainException>()));
    });

    test('addBook should add book to the shelf', () async {
      //arrange
      Book book = Book();
      //act
      sut.addBook(book);
      //assert
      expect(sut.books.length, 1);
    });
  });
}
