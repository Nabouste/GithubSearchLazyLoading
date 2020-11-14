import 'package:flutter/material.dart';
import 'package:github_search/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget{
  final String hintText;
  final Function(String) onSubmitted;
  final Widget title;

  const SearchBar({
    Key key,
    @required this.onSubmitted,
    this.title, this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.searchBarColor,
                  ),
                  color: AppTheme.searchBarColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                  ),
                  Expanded(
                    child: TextField(
                      onSubmitted: (val)=>onSubmitted(val),
                      // onChanged: (val) => onChanged(val),
                      decoration: InputDecoration(
                        // hintStyle: TextStyle(fontFamily: 'Quicksand'),
                        hintStyle: GoogleFonts.quicksand(),
                          hintText: hintText??'Cari Username', border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            if(title != null)Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 16,),
                Flexible(child: title),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}

