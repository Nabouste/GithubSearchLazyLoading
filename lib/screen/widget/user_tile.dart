import 'package:flutter/material.dart';

class ItemTiles extends StatelessWidget {
  final String name;
  final String image;

  ItemTiles({this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 50),
                          child: ListTile(
                            title: Text(name),
                            // subtitle: Text(data.),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 5,
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          image
                      ),
                      radius: 40,
                    ),
                  )),
            ),
          ],
        ));
  }
}