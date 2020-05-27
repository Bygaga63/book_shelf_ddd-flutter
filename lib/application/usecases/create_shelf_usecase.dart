import 'package:bookdddflutter/application/boundaries/create_shelf/create_shelf_output.dart';
import 'package:bookdddflutter/application/boundaries/create_shelf/create_shelf_usecase.dart';
import 'package:bookdddflutter/domain/factories/entity_factory.dart';
import 'package:bookdddflutter/domain/reporitories/book_shelf_repository.dart';

class CreateShelfUseCase implements ICreateShelfUseCase {
  final IBookShelfRepository shelfRepository;
  final IEntityFactory entityFactory;

  CreateShelfUseCase({this.entityFactory, this.shelfRepository});

  @override
  Future<CreateShelfOutput> call() async {
    final newBookShelf = entityFactory.newBookShelf();
    await shelfRepository.create(newBookShelf);
    return CreateShelfOutput(newBookShelf.id);
  }
}
