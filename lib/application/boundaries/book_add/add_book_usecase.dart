import 'package:bookdddflutter/application/boundaries/book_add/add_book_input.dart';
import 'package:bookdddflutter/application/boundaries/book_add/add_book_output.dart';
import 'package:bookdddflutter/application/usecases/usecase.dart';

abstract class IAddBookUseCase extends IUseCase<AddBookInput, AddBookOutput> {}
