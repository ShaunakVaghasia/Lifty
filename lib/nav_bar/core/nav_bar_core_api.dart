// Created by Shaunak Vaghasia

abstract class NavBarCoreApi {
  int get bottomBarIndex;
  void onChangeBottomBarIndex(Function(int bottomBarIndex) callback);
  void changeBottomBarIndex(int bottomBarIndex);
}
