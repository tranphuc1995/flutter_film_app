import 'dart:ui';

import 'package:film_app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

main() {
  group('test app_utils', () {
    test('test function getFontMaisonBold', () {
      expect(AppUtils.getFontMaisonBold(fontSize: 12, textColor: Colors.black),
          TextStyle(fontSize: 12, fontFamily: 'maison_bold', color: Colors.black));
    });

    test('test function getFontMaisonBold', () {
      expect(AppUtils.getFontMaisonLight(fontSize: 12, textColor: Colors.black),
          TextStyle(fontSize: 12, fontFamily: 'maison', color: Colors.black));
    });
  });
}
