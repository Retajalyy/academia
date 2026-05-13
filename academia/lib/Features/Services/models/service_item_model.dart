import 'package:flutter/material.dart';

enum ServiceStatus { none, opened, closed, pending }

class ServiceItemModel {
  final String id;
  final String title;
  final String subtitle;
  final String iconAsset;
  final Color accentColor;      // 👈 icon tint color
  final Color accentBackground; // 👈 icon container background
  final ServiceStatus status;
  final String? route;

  const ServiceItemModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconAsset,
    required this.accentColor,
    required this.accentBackground,
    this.status = ServiceStatus.none,
    this.route,
  });
}

class ServiceSectionModel {
  final String title;
  final List<ServiceItemModel> items;

  const ServiceSectionModel({
    required this.title,
    required this.items,
  });
}