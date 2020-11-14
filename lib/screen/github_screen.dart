import 'package:flutter/material.dart';
import 'package:github_search/core/bloc/search_bloc.dart';
import 'package:github_search/core/model/github_items.dart';
import 'package:github_search/screen/widget/git_empty.dart';
import 'package:github_search/screen/widget/git_loading.dart';
import 'package:github_search/screen/widget/search_bar.dart';
import 'package:github_search/screen/widget/user_tile.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {

  ScrollController controller;
  SearchBloc _searchBloc;
  var logger = Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchBloc = Provider.of(context,listen: false);
    controller = new ScrollController();
    controller.addListener(() {
      if (controller.position.pixels ==
          controller.position.maxScrollExtent) {
        _searchBloc.search();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        onSubmitted: (val) {
          if(val == ""){
          }else{
            _searchBloc.querySink(val);
            _searchBloc.search();
          }
        },
      ),
      body: StreamBuilder<List<GithubItems>>(
          stream: _searchBloc.listUserStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data.length == 0 ){
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/4,
                    width: 300,
                    child: GitEmpty(),
                  ),
                );
              }
              logger.d('dahg ? ${_searchBloc.hasReachMax}');
              return ListView.builder(
                  controller: controller,
                  itemCount: _searchBloc.hasReachMax
                      ? snapshot.data.length
                      : snapshot.data.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= snapshot.data.length) {
                      return SizedBox(
                          width: 100,
                          height: 75,
                          child: GitLoading());
                    } else {
                      return ItemTiles(
                        name: snapshot.data[index].login,
                        image: snapshot.data[index].avatar_url,
                      );
                    }
                  });
            }
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/4,
                width: 300,
                child: GitEmpty(),
              ),
            );
          }),
    );
  }
}


