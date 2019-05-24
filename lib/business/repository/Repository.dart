import 'package:techone/business/provider/FlashDealProvider.dart';
import 'package:techone/business/provider/SlideProvider.dart';
import 'package:techone/models/SlideModel.dart';
import 'package:techone/models/FlashDealModel.dart';

class Repository {
  SlideProvider _slideProvider = SlideProvider();
  FlashDealProvider _flashDealProvider = FlashDealProvider();

  List<SlideModel> getAllSlide() {
    return _slideProvider.getList();
  }

  List<FlashDealModel> getAllFlashDeal() {
    return _flashDealProvider.getList();
  }
}
