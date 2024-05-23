import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngdemo17/bloc/home/home_bloc.dart';
import 'package:ngdemo17/bloc/home/home_event.dart';
import 'package:ngdemo17/bloc/home/home_state.dart';
import 'package:ngdemo17/services/log_service.dart';
import 'my_feed_page.dart';
import 'my_likes_page.dart';
import 'my_profile_page.dart';
import 'my_search_page.dart';
import 'my_upload_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  PageController? _pageController;

  // int _currentTap = 0;

  @override
  void initState() {
    super.initState();
    homeBloc = context.read<HomeBloc>();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: _pageController,
            children: [
              MyFeedPage(
                pageController: _pageController,
              ),
              MySearchPage(),
              MyUploadPage(
                pageController: _pageController,
              ),
              MyLikesPage(),
              MyProfilePage(),
            ],
            onPageChanged: (int index) {
              homeBloc.add(PageViewEvent(currentPageIndex: index));
            },
          ),
          bottomNavigationBar: CupertinoTabBar(
            onTap: (int index) {
              homeBloc.add(BottomNavigationEvent(currentPageIndex: index));
              _pageController!.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            },
            currentIndex: state.currentIndex,
            activeColor: Color.fromRGBO(193, 53, 132, 1),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
              )
            ],
          ),
        );
      },
      listener: (BuildContext context, HomeState state) {
        LogService.i("$state");
      },
    );
  }
}
