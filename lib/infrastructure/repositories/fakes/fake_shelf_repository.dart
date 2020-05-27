import 'package:bookdddflutter/domain/entities/book_shelf.dart';
import 'package:bookdddflutter/domain/reporitories/book_shelf_repository.dart';
import 'package:bookdddflutter/domain/value_objects/identity.dart';

class FakeShelfRepository implements IBookShelfRepository {
  List<BookShelf> shelves = [BookShelf(id: Identity.fromString('bbb'))];

  @override
  Future<void> create(BookShelf bookShelf) async {
    return shelves.add(bookShelf);
  }

  @override
  Future<BookShelf> find(Identity shelfId) async {
    return shelves.where((sh) => sh.id == shelfId).first;
  }

  @override
  update(BookShelf bookShelf) {
    shelves.map((shelf) => shelf.id == bookShelf.id ? bookShelf : shelf);
  }
}
