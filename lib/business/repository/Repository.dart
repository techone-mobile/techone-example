import 'package:techone/business/provider/FlashDealProvider.dart';
import 'package:techone/business/provider/MostSellProvider.dart';
import 'package:techone/business/provider/NewProductProvider.dart';
import 'package:techone/business/provider/SearchProvider.dart';
import 'package:techone/business/provider/SlideProvider.dart';
import 'package:techone/business/provider/SuggestionsProductProvider.dart';
import 'package:techone/models/MostSellModel.dart';
import 'package:techone/models/NewProductModel.dart';
import 'package:techone/models/SearchHistoryModel.dart';
import 'package:techone/models/SearchPreviewModel.dart';
import 'package:techone/models/SlideModel.dart';
import 'package:techone/models/FlashDealModel.dart';
import 'package:techone/models/SuggestionsProductModel.dart';

class Repository {
  SlideProvider _slideProvider = SlideProvider();
  FlashDealProvider _flashDealProvider = FlashDealProvider();
  MostSellProvider _mostSellProvider = MostSellProvider();
  NewProductProvider _newProductProvider = NewProductProvider();
  SuggestionsProductProvider _suggestionsProductProvider = SuggestionsProductProvider();
  SearchProvider _searchProvider = SearchProvider();

  List<SlideModel> loadSlide() {
    return _slideProvider.load();
  }

  List<FlashDealModel> loadFlashDeal() {
    return _flashDealProvider.load();
  }

  List<MostSellModel> loadMostSell() {
    return _mostSellProvider.load();
  }

  List<NewProductModel> loadNewProduct() {
    return _newProductProvider.load();
  }

  List<SuggestionsProductModel> loadSuggestionsProduct() {
    return _suggestionsProductProvider.load();
  }

  List<SearchHistoryModel> loadSearchHistory() {
    return _searchProvider.loadHistory();
  }

  List<SearchPreviewModel> loadSearchPreview(String keyword) {
    return _searchProvider.loadPreview(keyword);
  }
}
