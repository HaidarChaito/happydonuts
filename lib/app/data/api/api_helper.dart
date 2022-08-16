import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/data/model/item.dart';
import 'package:happydonuts/app/data/model/item_description.dart';
import 'package:happydonuts/core/services/app_services.dart';

class ApiHelper {
  AppServices appServices = Get.find();

  Future<List<Item>> getItems() async {
    ListResult results =
        await appServices.firebaseStorage.ref('images').listAll();
    List<Item> items = [];
    for (var element in results.items) {
      items.add(
        Item(
          element.name,
          await element.getDownloadURL(),
          element,
        ),
      );
    }
    return items;
  }

  Future<ItemDescription?> getItemDescription(String itemname) async {
    try {
      Reference ref = appServices.firebaseStorage
          .ref()
          .child('descriptions')
          .child('/$itemname');

      Uint8List? downloadData = await ref.getData();
      String txtfileData = utf8.decode(downloadData!);
      var splitted = txtfileData.split('"');
      return ItemDescription(splitted[1], double.parse(splitted[3]));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
