import 'package:bookdddflutter/application/boundaries/dto/book_dto.dart';
import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_input.dart';
import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_output.dart';
import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_usecase.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class GetBookByIdUseCase extends IGetBookByIdUseCase {
  final IBookRepository bookRepository;

  GetBookByIdUseCase({@required this.bookRepository});

  @override
  Future<Either<Failure, GetBookByIdOutput>> call(
      GetBookByIdInput input) async {
    final book = await bookRepository.find(bookId: input.bookId);

    if (book == null) {
      return left(Failure('book not found'));
    }

    return right(GetBookByIdOutput(book: BookDto.fromEntity(book)));
  }
}
