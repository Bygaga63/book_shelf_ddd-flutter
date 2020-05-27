import 'package:bookdddflutter/application/boundaries/book_add/add_book_input.dart';
import 'package:bookdddflutter/application/usecases/add_book_usecase.dart';
import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/factories/entity_factory.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/reporitories/book_shelf_repository.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEntityFactory extends Mock implements IEntityFactory {}

class MockBookRepository extends Mock implements IBookRepository {}

class MockShelfRepository extends Mock implements IBookShelfRepository {}

void main() {
  AddBookUseCase useCase;
  MockShelfRepository mockShelfRepository;
  MockBookRepository mockBookRepository;
  MockEntityFactory mochEntityFactory;

  setUp(() {
    mochEntityFactory = MockEntityFactory();
    mockBookRepository = MockBookRepository();
    mockShelfRepository = MockShelfRepository();
    useCase = AddBookUseCase(
        shelfRepository: mockShelfRepository,
        bookRepository: mockBookRepository,
        entityFactory: mochEntityFactory);
  });

  group('AddBookUseCase', () {
    var title = Title.create('Book Title').getOrElse(null);
    var author = Author.create('Book Author').getOrElse(null);
    var isbn = ISBN.create('ISBN-10: 0-596-52068-9').getOrElse(null);
    var publishDate = PublishDate.create('2020-01-20').getOrElse(null);

    var input = AddBookInput(
        shelfId: Identity.fromString('add'),
        title: title,
        author: author,
        isbn: isbn,
        publishDate: publishDate);

    test('shoud return a Failure when bookshelf doesnt exitst', () async {
      //arrange
      when(mockShelfRepository.find(input.shelfId)).thenAnswer((_) => null);
      //act
      var result = await useCase(input);
      //assert

      expect(result.isLeft(), true);
    });

    test('should return book with created id when added succesfully', () async {
      //arrange
      when(mockShelfRepository.find(input.shelfId))
          .thenAnswer((_) async => BookShelf(id: input.shelfId));

      when(mochEntityFactory.newBook(
              title: anyNamed('title'),
              author: anyNamed('author'),
              isbn: anyNamed('isbn'),
              publishDate: anyNamed('publishDate')))
          .thenReturn(
        Book(
            id: Identity.fromString('bb'),
            title: input.title,
            author: input.author,
            isbn: input.isbn,
            publishDate: input.publishDate),
      );
      //act
      var result = await useCase(input);
      //assert

      expect(result.isRight(), true);
      expect(result.getOrElse(null).bookId, isNotNull);
      verify(mockBookRepository.add(any)).called(1);
    });
  });
}
