import 'package:bookdddflutter/application/boundaries/book_add/add_book_input.dart';
import 'package:bookdddflutter/application/boundaries/book_add/add_book_output.dart';
import 'package:bookdddflutter/application/usecases/usecase.dart';
import 'package:bookdddflutter/domain/domain_exception.dart';
import 'package:bookdddflutter/domain/entities/book_entity.dart';
import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/factories/entity_factory.dart';
import 'package:bookdddflutter/domain/reporitories/book_repository.dart';
import 'package:bookdddflutter/domain/reporitories/book_shelf_repository.dart';
import 'package:bookdddflutter/domain/value_objects/failure.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';
import 'package:dartz/dartz.dart';

class AddBookUseCase implements IUseCase<AddBookInput, AddBookOutput> {
  final IBookShelfRepository _shelfRepository;
  final IBookRepository _bookRepository;
  final IEntityFactory _entityFactory;

  AddBookUseCase({
    IBookShelfRepository shelfRepository,
    IBookRepository bookRepository,
    IEntityFactory entityFactory,
  })  : _bookRepository = bookRepository,
        _entityFactory = entityFactory,
        _shelfRepository = shelfRepository;

  Future<Either<Failure, AddBookOutput>> call(AddBookInput input) async {
    Book newBook = _createBookFromInput(input);
    Either<Failure, BookShelf> updatedShelfCandidate =
        await _addBookToShelf(newBook, input.shelfId);

    if (updatedShelfCandidate.isLeft()) {
      return updatedShelfCandidate.fold((err) => left(err), (_) => null);
    }

    await _bookRepository.add(newBook);
    await _shelfRepository.update(updatedShelfCandidate.getOrElse(null));

    return right(_createOtputtFromBook(newBook));
  }

  Book _createBookFromInput(AddBookInput input) {
    return _entityFactory.newBook(
        title: input.title,
        author: input.author,
        isbn: input.isbn,
        publishDate: input.publishDate);
  }

  Future<Either<Failure, BookShelf>> _addBookToShelf(
      Book newBook, Identity shelfId) async {
    var bookShelf = await _shelfRepository.find(shelfId);
    if (bookShelf == null) {
      return left(Failure('book shelf not found'));
    }

    try {
      bookShelf.addBook(newBook);
    } on DomainException {
      return left(Failure('book shelf has reached its maximum capacity'));
    }

    return right(bookShelf);
  }

  AddBookOutput _createOtputtFromBook(Book book) {
    return AddBookOutput(
        bookId: book.id,
        publishDate: book.publishDate,
        title: book.title,
        author: book.author,
        shelfId: book.shelfId,
        isbn: book.isbn);
  }
}
