import 'package:rxdart/rxdart.dart';
import 'package:techone/business/repository/Repository.dart';
import 'package:techone/models/NewProductModel.dart';

class NewProductBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<NewProductModel>>();

  Observable<List<NewProductModel>> stream() {
    return _streamController.stream;
  }

  getAllNewProduct() async {
    List<NewProductModel> newProduct = await _repository.getAllNewProduct();
    _streamController.add(newProduct);
  }

  dispose() {
    _streamController.close();
  }
}

final newProductBloc = NewProductBloc();