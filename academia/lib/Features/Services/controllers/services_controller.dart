import 'package:flutter/material.dart';

import '../models/service_item_model.dart';
import '../services/services_service.dart';
import 'package:flutter/foundation.dart'; // ChangeNotifier lives here

class ServicesController extends ChangeNotifier {
  final ServicesService _servicesService;

  ServicesController({ServicesService? servicesService})
      : _servicesService = servicesService ?? ServicesService();

  List<ServiceSectionModel> _sections = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ServiceSectionModel> get sections => _sections;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadServices() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _sections = await _servicesService.fetchSections();
    } catch (e) {
      _errorMessage = 'Failed to load services. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onServiceTapped(ServiceItemModel item, BuildContext context) {
    if (item.route != null) {
      Navigator.pushNamed(context, item.route!);
    }
  }
}