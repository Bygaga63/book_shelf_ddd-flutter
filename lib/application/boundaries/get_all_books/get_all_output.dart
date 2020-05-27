import 'dart:collection';

import '../dto/book_dto.dart';

class GetAllBooksOutput {
  final UnmodifiableListView<BookDto> books;

  GetAllBooksOutput({this.books});
}
