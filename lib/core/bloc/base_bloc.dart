import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseBloc extends ChangeNotifier {
  final _loadingStatus = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get loadingStatus => _loadingStatus.stream;

  void setBusy(){
    _loadingStatus.sink.add(true);
  }

  void setIdle(){
    _loadingStatus.sink.add(false);
  }

  void setError(){
    _loadingStatus.addError('error');
  }

  @override
  void dispose() {
    _loadingStatus.close();
    super.dispose();
  }
}