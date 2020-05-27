import 'package:bookdddflutter/infrastructure/datasources/sql_lite_datasource.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockSqlLiteDatasource extends Mock implements Database {}

void main() {
  SqlLightDatasource sut;
  MockSqlLiteDatasource mockDatasource;

  var map = {
    "Book_Id": "aaa",
    "Shelf_Id": "bbb",
    "Title": "Title",
    "Author": "Author",
    "ISBN": "ISBN-10: 0-596-52068-9",
    "Publish_Date": "2020-01-20"
  };
  var bookModel = BookModel.fromMap(map);

  setUp(() {
    mockDatasource = MockSqlLiteDatasource();
    sut = SqlLightDatasource(datasource: mockDatasource);
  });

  group('SqlLiteDatasource.addBook', () {
    test('should perform a database insert', () async {
      //arrange
      when(mockDatasource.insert('books', bookModel.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace))
          .thenAnswer((_) async => 1);
      //act
      await sut.addBook(bookModel);
      //assert
      verify(mockDatasource.insert('books', bookModel.toMap(),
              conflictAlgorithm: ConflictAlgorithm.replace))
          .called(1);
    });
  });

  group('SqlLiteDatasource.findBook', () {
    test('should perform query method', () async {
      //arrange
      when(mockDatasource.query('books',
              where: anyNamed('where'), whereArgs: anyNamed('whereArgs')))
          .thenAnswer((_) async => [map]);
      //act
      await sut.findBook(bookModel.id);
      //assert
      expect(bookModel, isNotNull);
      expect(bookModel.id.id, 'aaa');
    });
  });

  group('SqfliteDatasource.findAllBooks', () {
    test('should perform database query and return all records', () async {
      //arrange
      when(mockDatasource.query('books')).thenAnswer((_) async => [map]);

      //act
      var bookModels = await sut.findAllBooks();

      //assert
      expect(bookModels, isNotEmpty);
      verify(mockDatasource.query('books'));
    });
  });
}
