import 'package:flutter/material.dart';

class CardInfo {
  final String title, icon, name, src, num;

  CardInfo({
    required this.title, required this.name, required this.icon, required this.src, required this.num
});
}

List demoCardInfo = [
  CardInfo(
    title: 'Male',
    name: 'MALE',
    src: 'assets/images/profile.jpg',
    icon: '',
    num: '800',
  ),
  CardInfo(
    title: 'Female',
    name: 'FEMALE',
    src: 'assets/images/profile.jpg',
    icon: '',
    num: '400',
  ),
  CardInfo(
    title: 'Total Voters',
    name: 'EXECUTIVES',
    src: 'assets/images/profile.jpg',
    icon: '',
    num: '400',
  ),
  CardInfo(
    title: 'NDC Member',
    name: 'MINORS',
    src: 'assets/images/profile.jpg',
    icon: '',
    num: '200',
  ),
];