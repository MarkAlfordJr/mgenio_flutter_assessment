// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mgenio_app_assessment/Presentation/ResultView/result_view_controller.dart';

class ResultView extends ConsumerStatefulWidget {
  const ResultView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<ResultView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("M O R S I O"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
        children: <Widget>[
          /// TITLE TEXT STYLING
          const Text(
            'Results',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Montserrat',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.1666666666666667),
          ),
          const SizedBox(height: 16),

          /// SUBTEXT STYLING
          const Text(
            "Congrats! You're now a spy who can decode morse code!",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Montserrat',
                fontSize: 16,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5),
          ),
          const SizedBox(height: 24),

          /// RESULT TEXT STYLING
          Text(
            ref.watch(resultViewControllerProvider),
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
                ),
            maxLines: 10,
          ),
          const SizedBox(height: 24),

          /// RESULT BUTTON
          SizedBox(
            height: 48,
            child: TextButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0))),
              ),
              child: const Text(
                "Go Again",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
