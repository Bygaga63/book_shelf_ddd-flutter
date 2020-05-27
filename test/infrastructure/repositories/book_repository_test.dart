import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/value_objects/author.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/domain/value_objects/isbn.dart';
import 'package:bookdddflutter/domain/value_objects/publish_date.dart';
import 'package:bookdddflutter/domain/value_objects/title.dart';
import 'package:bookdddflutter/infrastructure/datasources/data_source.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';
import 'package:bookdddflutter/infrastructure/repositories/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatasource extends Mock implements IDatasource {}

void main() {
  IBookRepository bookRepository;
  MockDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockDatasource();
    bookRepository = BookRepository(datasource: mockDatasource);
  });

  group('BookRepository.add', () {
    test('should add a book when call to the datasource is succesfull',
        () async {
      var bookId = Identity.fromString('bookId');
      var shellfId = Identity.fromString('sheldId');
      var id = Identity.fromString('bookId');
      var title = Title.create('Book Title').getOrElse(null);
      var author = Author.create('Book Author').getOrElse(null);
      var isbn = ISBN.create('ISBN-10: 0-596-52068-9').getOrElse(null);
      var publishDate = PublishDate.create('2020-01-20').getOrElse(null);

      final book = BookModel(
          id: bookId,
          isbn: isbn,
          author: author,
          title: title,
          publishDate: publishDate,
          shelfId: shellfId);
      //arrange
      //act
      await bookRepository.add(book);
      //assert

      verify(mockDatasource.addBook(any)).called(1);
    });
  });

  group('BookRepository.findAll', () {
    test('should return a list of books when the call to the data source',
        () async {
      //arrange
      var map = {
        "Book_Id": "aaa",
        "Shelf_id": "bbb",
        "Title": "Title",
        "Author": "Author",
        "ISBN": "ISBN-10: 0-596-52068-9",
        "Publish_Date": "2020-01-20"
      };
      when(mockDatasource.findAllBooks())
          .thenAnswer((_) async => [BookModel.fromMap(map)]);
      //act
      final result = await bookRepository.findAll();
      //assert
      expect(result, isNotEmpty);
      verify(mockDatasource.findAllBooks()).called(1);
    });
  });

  group('BookRepository.add', () {
    test('should return book', () async {
      //arrange
      var map = {
        "Book_Id": "aaa",
        "Shelf_id": "bbb",
        "Title": "Title",
        "Author": "Author",
        "ISBN": "ISBN-10: 0-596-52068-9",
        "Publish_Date": "2020-01-20"
      };
      var book = BookModel.fromMap(map);
      when(mockDatasource.findBook(any)).thenAnswer((_) async => book);
      //act
      final result = await bookRepository.find(bookId: book.id);
      //assert
      expect(result, book);
      verify(mockDatasource.findBook(any)).called(1);
    });
  });
}
