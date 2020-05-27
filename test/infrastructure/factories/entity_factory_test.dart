import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:bookdddflutter/infrastructure/factories/entity_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  EntityFactory entityFactory;

  setUp(() {
    entityFactory = EntityFactory();
  });

  test('should create a book from the provided information', () async {
    //arrange
    var title = Title.create('Domain Driven Design').getOrElse(null);
    var author = Author.create('Vaugh Vernon').getOrElse(null);
    var isbn = ISBN.create('ISBN-10: 0-596-52068-9').getOrElse(null);
    var publishDate = PublishDate.create('2019-01-20').getOrElse(null);
    //act
    var book = entityFactory.newBook(
      title: title,
      author: author,
      isbn: isbn,
      publishDate: publishDate,
    );

    //assert
    expect(book.id, isNotNull);
    expect(book.title, title);
  });
}
