import 'package:bookdddflutter/application/boundaries/create_shelf/create_shelf_usecase.dart';
import 'package:bookdddflutter/application/boundaries/get_all_books/get_all_usecase.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel {
  List<BookShelf> _shelvs = [];

  List<BookShelf> get shelvs => _shelvs;

  final ICreateShelfUseCase _createShelfUseCase;
  final IGetAllUseCase _getAllUseCase;

  HomeViewModel(
      {@required ICreateShelfUseCase createShelfUseCase,
      @required IGetAllUseCase getAllUseCase})
      : _createShelfUseCase = createShelfUseCase,
        _getAllUseCase = getAllUseCase;
}
