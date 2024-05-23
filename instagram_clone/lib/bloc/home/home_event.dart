abstract class HomeEvent {}

class BottomNavigationEvent extends HomeEvent {
  final int currentPageIndex;
  BottomNavigationEvent({required this.currentPageIndex});
}

class PageViewEvent extends HomeEvent {
  final int currentPageIndex;

  PageViewEvent({required this.currentPageIndex});
}
