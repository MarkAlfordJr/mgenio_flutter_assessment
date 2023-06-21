import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgenio_app_assessment/Presentation/HomeView/home_view_controller.dart';

final resultViewControllerProvider = Provider.autoDispose((ref) {
  final resultText = ref.watch(homeViewControllerProvider);
  return resultText;
});

