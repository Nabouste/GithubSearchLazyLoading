

import 'package:github_search/core/model/github_items.dart';
import 'package:github_search/core/model/github_response.dart';
import 'package:github_search/core/service/github_repository.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class SearchBloc extends BaseBloc {
  var logger = Logger();
  final _repository = GithubRepository();
  GithubResponse githubResponse;
  GithubResponse items = new GithubResponse();
  List<GithubItems> _list =[];
  bool _hasReachMax = false;

  List<GithubItems> get list => _list;

  set list(List<GithubItems> value) {
    _list = value;
    notifyListeners();
  }
  bool get hasReachMax => _hasReachMax;
  set hasReachMax(bool value) {
    _hasReachMax = value;
    notifyListeners();
  }

  int _page = 0;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  String _tempQuery;


  String get tempQuery => _tempQuery;

  set tempQuery(String value) {
    _tempQuery = value;
    notifyListeners();
  }

  final _totalCountSubject = BehaviorSubject<int>();
  Function(int) get totalCountSink => _totalCountSubject.sink.add;
  Stream<int> get totalCountStream => _totalCountSubject.stream;

  final _listUserSubject = BehaviorSubject<List<GithubItems>>();
  Function(List<GithubItems>) get listUserSink => _listUserSubject.sink.add;
  Stream<List<GithubItems>> get listUserStream => _listUserSubject.stream;

  final _querySubject = BehaviorSubject<String>();
  Function(String) get querySink => _querySubject.sink.add;
  Stream<String> get queryStream => _querySubject.stream;

  Future search({
    Function(GithubResponse response)onSuccess,
    Function(GithubResponse response) onFailure}) async {
    setBusy();

    if(_tempQuery!=_querySubject.value){
      list = [];
      _listUserSubject.add(list);
    }

    if(_list.isEmpty){
      githubResponse = await _repository.seachUser(
          query: _querySubject.value??'username',
          start:0
      );
      _tempQuery = _querySubject.value;


      if (githubResponse.incomplete_results == false) {
        if(githubResponse.total_count <= githubResponse.items.length){
          hasReachMax = true;
          list.addAll(githubResponse.items);
          _listUserSubject.add(githubResponse.items);
        }else{
          hasReachMax = false;

          if (onSuccess != null)onSuccess(githubResponse);
          list.addAll(githubResponse.items);
          _listUserSubject.add(githubResponse.items);
        }
      } else if (githubResponse.incomplete_results == true) {
        if (onFailure != null) onFailure(githubResponse);
        _listUserSubject.add([]);
      }


    }else{
      var newPage = page +1;
      githubResponse = await _repository.seachUser(
        query: _querySubject.value??'username',
        start: newPage
      );
      page = newPage;
      _tempQuery = _querySubject.value;

      if (githubResponse.incomplete_results == false) {
        if(_list.length >= githubResponse.total_count ){
          hasReachMax = true;
          _listUserSubject.add(_list);
          _list.addAll(githubResponse.items);
        }else{
          _list.addAll(githubResponse.items);
          hasReachMax = false;
          if (onSuccess != null)onSuccess(githubResponse);
          _listUserSubject.add(_list);
        }

      } else if (githubResponse.incomplete_results == true) {
        if (onFailure != null) onFailure(githubResponse);
        _listUserSubject.add([]);
      }
      logger.d('max ${_list.length}');
      logger.d('max $hasReachMax');
    }
    setIdle();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _listUserSubject?.close();
    _querySubject?.close();
    _totalCountSubject?.close();
  }
}