// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mgenio_app_assessment/Data/Repository_Impl/home_view_repo_impl.dart';

/// this Provider is used to give out the data, from the home Repository
/// the [input] comes the manipulated state, which will be changed by the UI 
final homeViewControllerProvider = Provider((ref) {
  final homeViewRepo = ref.watch(homeViewRepoProvider);
  final input = ref.watch(homeViewUserInputControllerProvider);
  final result = homeViewRepo.decodeMorse(input);
  return result;
});

final homeViewUserInputControllerProvider = StateNotifierProvider<HomeViewUserInputController, String>((ref) => 
HomeViewUserInputController());

class HomeViewUserInputController extends StateNotifier<String> {
  HomeViewUserInputController() : super("");

  /// method needed for UI to change the state
  void updateText(String userInput) {
    state = userInput;
  }
}