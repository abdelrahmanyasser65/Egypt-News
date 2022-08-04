import 'package:flutter/material.dart';
import 'package:hh/helper/cach_helper.dart';

import 'helper/dio_helper.dart';
import 'modules/business.dart';
import 'modules/entertainment.dart';
import 'modules/health.dart';
import 'modules/science.dart';
import 'modules/sports.dart';
import 'modules/technology.dart';

class NewsProvider with ChangeNotifier {
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety), label: 'Health'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen(),
    HealthScreen(),
    EntertainmentScreen(),
  ];
  List business = [];

  void getBusiness() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      business = value.data['articles'];
    });
    notifyListeners();
  }
  List technology = [];

  void getTechnology() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      technology = value.data['articles'];
    });
    notifyListeners();
  }
  List entertainment = [];

  void getEntertainment() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      entertainment = value.data['articles'];
    });
    notifyListeners();
  }
  List sports = [];

  void getSports() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      sports = value.data['articles'];
    });
    notifyListeners();
  }

  List health = [];

  void getHealth() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      health = value.data['articles'];
    });
    notifyListeners();
  }

  List science = [];

  void getScience() {
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      science = value.data['articles'];
    });
    notifyListeners();
  }
  List search = [];

  void getSearch(String value) {

    DioHelper.getData(url: 'v2/everything', query: {
      'q':value,
      'apiKey': '16574bf297b849dfb24a9976c5425c64'
    }).then((value) {
      search = value.data['articles'];
    });
    notifyListeners();
  }
}

class AppProvider with ChangeNotifier {
  bool isDark = false;

  void changeAppMode(
      {fromShared}
) {
    if(fromShared!=null){
      isDark=fromShared;
    }
    else{
      isDark = !isDark;
    }

    CashHelper.putData(key: 'isDark', value: isDark);
    notifyListeners();
  }
}
