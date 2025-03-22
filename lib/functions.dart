import 'package:flutter/material.dart';
import 'package:get/get.dart';



String capitalizeEachWord(String text) {
  return text.split(' ').map((word) {
    if (word.isEmpty) return "";
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}
