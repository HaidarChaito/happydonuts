import 'package:get/get.dart';
import 'package:happydonuts/app/data/api/api_helper.dart';
import 'package:happydonuts/app/data/model/item.dart';
import 'package:happydonuts/app/data/model/item_description.dart';
import 'package:happydonuts/routes/routes.dart';

class HomeController extends GetxController {
  ApiHelper apiHelper = ApiHelper();
  late List<Item> items;
  late Item currentItem;
  late ItemDescription currentItemDescription;
  bool isLoading = true;

  Future<List<Item>> getItems() async {
    items = await apiHelper.getItems();
    isLoading = false;
    return items;
  }

  Future<ItemDescription> getItemDescription() async {
    isLoading = true;
    currentItemDescription = await apiHelper
            .getItemDescription('${currentItem.nameWithoutExtension}.txt') ??
        ItemDescription('null', 0);
    isLoading = false;
    return currentItemDescription;
  }

  void toProductDetails() {
    Get.toNamed(AppRoutes.productDetails);
  }

  void setCurrentItem(Item item) {
    currentItem = item;
  }

  Item get getCurrentItem {
    return currentItem;
  }
}
