
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/core/service/github_repository.dart';
import 'package:logger/logger.dart';

void main(){

  final _authRepo = GithubRepository();

  test("get all uses",() async{
    bool isLogin = false;

    final response = await _authRepo.seachUser();
    if(response.incomplete_results == false){
      isLogin = true;
      var logger = Logger();
      logger.d(response);
    }
    expect(isLogin, true);
  });

}