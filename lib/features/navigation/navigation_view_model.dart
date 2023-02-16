import 'navigation_view_controler.dart';

class NavigationViewModel extends NavigationProtocol {
  int _currentIndex = 0;

  @override
  int get currentIndex => _currentIndex;

  @override
  void didTapSelectedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
