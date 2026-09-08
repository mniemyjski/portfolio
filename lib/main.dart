import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/app/portfolio_app.dart';

void main() {
  usePathUrlStrategy();
  runApp(const PortfolioApp());
}
