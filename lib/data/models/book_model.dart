import 'package:flutter/material.dart';

class Book {
  final String title;
  final Color color;

  const Book({required this.title, required this.color});
}

class MockData {
  static const List<String> categories = ["吉伊杰", "杰伊哦哦", "西杰诶娜娜", "迪勒弗"];

  static const List<Book> books = [
    Book(title: "比杰诶西艾", color: Colors.black),
    Book(title: "艾伊迪", color: Colors.red),
    Book(title: "艾屁艾艾杰伊", color: Colors.purpleAccent),
    Book(title: "勒艾诶艾弗伊", color: Colors.orange),
    Book(title: "比伊艾弗伊", color: Color(0xffF5F5DC)),
  ];
}
