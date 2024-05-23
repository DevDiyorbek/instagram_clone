import 'package:bloc/bloc.dart';
import 'package:ngdemo17/bloc/home/home_event.dart';
import 'package:ngdemo17/bloc/home/home_state.dart';

abstract class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(CurrentIndexState(currentIndex: 0)) {
    on<BottomNavigationEvent>(_onBottomNavigationEvent);
    on<PageViewEvent>(_onPageViewEvent);
  }

  Future<void> _onBottomNavigationEvent(
      BottomNavigationEvent event, Emitter<HomeState> emit) async {
    emit(CurrentIndexState(currentIndex: event.currentPageIndex));
  }

  Future<void> _onPageViewEvent(
      PageViewEvent event, Emitter<HomeState> emit) async {
    emit(CurrentIndexState(currentIndex: event.currentPageIndex));
  }
}
