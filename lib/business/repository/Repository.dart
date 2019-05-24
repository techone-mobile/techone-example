import 'package:techone/business/provider/FlashDealProvider.dart';
import 'package:techone/business/provider/MostSellProvider.dart';
import 'package:techone/business/provider/NewProductProvider.dart';
import 'package:techone/business/provider/SlideProvider.dart';
import 'package:techone/models/MostSellModel.dart';
import 'package:techone/models/NewProductModel.dart';
import 'package:techone/models/SlideModel.dart';
import 'package:techone/models/FlashDealModel.dart';

class Repository {
  SlideProvider _slideProvider = SlideProvider();
  FlashDealProvider _flashDealProvider = FlashDealProvider();
  MostSellProvider _mostSellProvider = MostSellProvider();
  NewProductProvider _newProductProvider = NewProductProvider();

  List<SlideModel> getAllSlide() {
    return _slideProvider.getList();
  }

  List<FlashDealModel> getAllFlashDeal() {
    return _flashDealProvider.getList();
  }

  List<MostSellModel> getAllMostSell() {
    return _mostSellProvider.getList();
  }

  List<NewProductModel> getAllNewProduct() {
    return _newProductProvider.getList();
  }
}
