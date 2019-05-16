import 'package:flutter/material.dart';
import 'package:techone/models/SlideModel.dart';
import 'package:techone/ui/fragment/Dot.dart';

class SlideProvider {
  static List<SlideModel> getList() {
    List<SlideModel> listSlide = List<SlideModel>();
    
    listSlide.add(SlideModel(
        Dots.dot(Colors.black54), 'https://i.imgur.com/c7Uvh6h.jpg', 'A'));
    listSlide.add(SlideModel(
        Dots.dot(Colors.black54), 'https://cdn.shopify.com/s/files/1/0810/8331/files/category_banner_ip8.jpg?1347021331059137510', 'B'));
    listSlide.add(SlideModel(
        Dots.dot(Colors.black54), 'https://i.imgur.com/gAumC4V.jpg', 'C'));
    listSlide.add(SlideModel(
        Dots.dot(Colors.black54), 'https://i.imgur.com/n7g3Naf.jpg', 'D'));
    
    return listSlide;
  }
}
