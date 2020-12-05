import 'package:alarm_app/enums.dart';
import 'package:flutter/foundation.dart';

import 'package:alarm_app/enums.dart';
import 'package:provider/provider.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType,
      {this.title, this.imageSource}); // 1 paramertter is necessary and the other two are ogptional

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

//Important
    notifyListeners();// notify all the consumer listen to it
  }
}

