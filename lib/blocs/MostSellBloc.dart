import 'package:rxdart/rxdart.dart';
import 'package:techone/business/repository/Repository.dart';
import 'package:techone/models/MostSellModel.dart';

class MostSellBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<MostSellModel>>();

  Observable<List<MostSellModel>> stream() {
    return _streamController.stream;
  }

  getAllMostSell() async {
    List<MostSellModel> flashDeal = await _repository.getAllMostSell();
    _streamController.add(flashDeal);
  }

  dispose() {
    _streamController.close();
  }
}

final mostSellBloc = MostSellBloc();
