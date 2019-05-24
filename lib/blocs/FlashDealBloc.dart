import 'package:techone/business/repository/Repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:techone/models/FlashDealModel.dart';

class FlashDealBloc {
  Repository _repository = Repository();
  final _streamController = PublishSubject<List<FlashDealModel>>();

  Observable<List<FlashDealModel>> stream() {
    return _streamController.stream;
  }

  getAllFlashDeal() async {
    List<FlashDealModel> flashDeal = await _repository.getAllFlashDeal();
    _streamController.add(flashDeal);
  }

  dispose() {
    _streamController.close();
  }
}

final flashDealBlock = FlashDealBloc();
