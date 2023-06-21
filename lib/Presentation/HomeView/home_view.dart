import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgenio_app_assessment/Presentation/HomeView/home_view_controller.dart';
import 'package:mgenio_app_assessment/Presentation/ResultView/result_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  // get text edit controller
  String textFieldMessage = '';
  // method to navigate to second view
  void navToResultView() {
    ref
        .read(homeViewUserInputControllerProvider.notifier)
        .updateText(textFieldMessage);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultView(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final morseTextController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("M O R S I O"),),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
          children: <Widget> [
            /// TITLE TEXT STYLING
            const Text(
              'Enter a Morse Code',
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
              'Be sure to separate morse letters by 1 space, and to separate words by 3 spaces',
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

            /// INPUTFIELD
            SizedBox(
              height: 50,
              child: TextField(
                controller: morseTextController,
                smartDashesType: SmartDashesType.disabled,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  hintText: "Give it a try..",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16)
                    )
                    
                  )
                ),
                onChanged: (text) {
                  textFieldMessage = text;
                  
                },
              ),
            ),
            const SizedBox(height: 24),

            /// RESULT BUTTON
            SizedBox(
              height: 48,
              child: TextButton(
                onPressed: () => {
                  navToResultView(),
                  // to make sure that the textfield is reset
                  morseTextController.clear(),
                  textFieldMessage = ""
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0))),
                ),
                child: const Text(
                  "Result",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}