import 'dart:io';

import 'package:allaboutapps/Maps/ClubsMap.dart';
import 'package:allaboutapps/Network/DioManager.dart';
import 'package:allaboutapps/View/ClubDetail/ClubDetailView.dart';
import 'package:allaboutapps/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ClubListModel extends ChangeNotifier{
  late BuildContext _context;
  late DioManager _dio;
  late bool _loading;
  late bool _fetched;
  late bool _error;
  late ClubsMap _clubsMap;
  bool _sortByName = true;

  ClubListModel(BuildContext context, DioManager dio){
    _context = context;
    _dio = dio;
    _loading = true;
    _fetched = false;
    _error = false;
    _getContent();
  }

  @override
  dispose(){
    super.dispose();
  }

  BuildContext getContext() => _context;

  ClubsMap getMyClubsMap() => _clubsMap;
  int getClassCount() => _clubsMap.clubs!.length;

  void sortClub(){
    if (_sortByName) {
      _clubsMap.clubs?.sort((a, b) {
        return a.name!.compareTo(b.name!);
      });
    } else {
      _clubsMap.clubs?.sort((a, b) {
        return b.value!.compareTo(a.value!);
      });
    }
    _sortByName = !_sortByName;
    notifyListeners();
  }

  void openClubDetails(index){
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (context) => ClubDetailView(club: _clubsMap.clubs![index]),
      ),
    );
  }

  _getContent() async {
    try{
      _loading = true;
      Response response = await _dio.getRequest(Constants.clubsUrl, {}, Options());
      if (response.statusCode == HttpStatus.ok){
        _clubsMap = ClubsMap.fromJson(response.data);
        sortClub();
        _loading = false;
        _fetched = true;
        _error = false;
        notifyListeners();
      } else {
        throw Exception('error');
      }
    } catch(e){
      _loading = false;
      _error = true;
      _fetched = false;
      notifyListeners();
    }
  }

  String getLoadingState(){
    if (_loading)
      return 'loading';
    else if (!_loading && _error && !_fetched){
      return 'error';
    } else if (!_loading && !_error && _fetched){
      return 'success';
    }
    return '';
  }

  refresh(){
    _loading = true;
    _error = false;
    _fetched = false;
    notifyListeners();
    _getContent();
  }
}