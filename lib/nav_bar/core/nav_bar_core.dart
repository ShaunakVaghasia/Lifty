// Created by Shaunak Vaghasia

import 'package:lifty/nav_bar/core/nav_bar_core_api.dart';

class NavBarCore implements NavBarCoreApi {
  final int _bottomBarIndex = 0;

  @override
  int get bottomBarIndex => _bottomBarIndex;

  Function(int bottomBarIndex) _onChangeBottomBarIndex = (value) {};
  @override
  void onChangeBottomBarIndex(Function(int bottomBarIndex) callback) => _onChangeBottomBarIndex = callback;
  @override
  void changeBottomBarIndex(int bottomBarIndex) => _onChangeBottomBarIndex(bottomBarIndex);
}
