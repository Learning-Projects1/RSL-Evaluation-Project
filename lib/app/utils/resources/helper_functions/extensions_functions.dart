

import 'package:flutter/cupertino.dart';

extension StringExtension on String {
  String capitalize() {
    if(this != "" && this != "null" && this != "Null" && this != null){
      return "${this[0].toUpperCase()}${substring(1)}";
    }else{
      return "";
    }
  }


  int toInt() {
    return int.parse(this);
  }

  double toDouble() {
    return double.parse(this);
  }

}

extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

extension IntExtension on dynamic{

  ///Converting minutes in hours
  String toHoursMinutes(){

    var minutes = this;

    var d = Duration(minutes:minutes.toInt());
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }


  ///Null or Empty
  bool isNullOrEmpty(){
    var statement = this;
    if(statement == null || statement.toString().isEmpty){
      return true;
    }else{
      return false;
    }
  }
}