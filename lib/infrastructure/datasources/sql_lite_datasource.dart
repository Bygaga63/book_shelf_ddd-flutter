import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:bookdddflutter/infrastructure/datasources/data_source.dart';
import 'package:bookdddflutter/infrastructure/models/book_model.dart';
import 'package:sqflite/sqflite.dart';

class SqlLightDatasource implements IDatasource {
  final Database _db;
  final _table = 'books';
  SqlLightDatasource({Database datasource}) : _db = datasource;

  @override
  addBook(BookModel model) async {
    final result = await _db.insert(_table, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  @override
  Future<BookModel> findBook(Identity bookId) async {
    var listOfMaps = await _db.query(
      'books',
      where: 'Book_Id = ?',
      whereArgs: [bookId.id],
    );
    return BookModel.fromMap(listOfMaps.first);
  }

  @override
  Future<List<BookModel>> findAllBooks() async {
    var listOfMaps = await _db.query('books');
    if (listOfMaps.isEmpty) return [];

    return listOfMaps.map<BookModel>((map) => BookModel.fromMap(map)).toList();
  }
}
