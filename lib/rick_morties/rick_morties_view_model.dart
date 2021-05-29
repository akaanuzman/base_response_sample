import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/network/project_network_manager.dart';
import 'model/character_model.dart';
import 'ricky_morties.dart';

abstract class RickyMortiesViewModel extends State<RickyMorties> {
  final Dio dio = ProjectNetwrokManager.instance.dio;

  List<CharacterModel> models = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.EPISODE.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharcterModel = BaseResponseCharacter.fromJson(data);
        models = baseCharcterModel.results ?? [];
      } else if (data is List) {
        models = data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }

    setState(() {});
  }
}

enum ServicePath { EPISODE }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.EPISODE:
        return '/episode';
    }
  }
}
