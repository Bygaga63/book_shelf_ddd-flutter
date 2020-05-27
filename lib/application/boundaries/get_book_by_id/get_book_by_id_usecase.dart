import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_input.dart';
import 'package:bookdddflutter/application/boundaries/get_book_by_id/get_book_by_id_output.dart';
import 'package:bookdddflutter/application/usecases/usecase.dart';

abstract class IGetBookByIdUseCase
    extends IUseCase<GetBookByIdInput, GetBookByIdOutput> {}
