import 'dart:collection';

import 'package:bookdddflutter/application/boundaries/dto/book_dto.dart';
import 'package:bookdddflutter/application/boundaries/get_all_books/get_all_output.dart';
import 'package:bookdddflutter/application/boundaries/get_all_books/get_all_usecase.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';

class GetAllUseCase implements IGetAllUseCase {
  IBookRepository _bookRepository;

  GetAllUseCase({bookRepository}) : _bookRepository = bookRepository;

  @override
  Future<GetAllBooksOutput> call() async {
    final books = await _bookRepository.findAll();
    List<BookDto> result =
        books.map((book) => BookDto.fromEntity(book)).toList();
    return GetAllBooksOutput(books: UnmodifiableListView(result));
  }
}
