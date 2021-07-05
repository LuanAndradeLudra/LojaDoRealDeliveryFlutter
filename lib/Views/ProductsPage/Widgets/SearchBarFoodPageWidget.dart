import 'package:flutter/material.dart';

Widget searchBarFoodPageWidget() => new TextField(
  keyboardType: TextInputType.text,
  decoration: InputDecoration(
    hintText: 'Pesquisar',
    hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
    prefixIcon: Padding(padding: EdgeInsets.only(left: 20, right: 20), child: Icon(Icons.search, color: Colors.grey[500],),),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    contentPadding: EdgeInsets.all(24),
    fillColor: Colors.grey[200],
  ),
);