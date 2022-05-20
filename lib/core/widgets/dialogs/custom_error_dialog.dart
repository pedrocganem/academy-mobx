import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorDialog extends StatelessWidget {
  final String errorMessage;
  final void Function() onPressed;
   CustomErrorDialog(
      {Key? key, required this.errorMessage, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      backgroundColor: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.network(
                "https://assets3.lottiefiles.com/packages/lf20_tl52xzvn.json",
                repeat: false,
                fit: BoxFit.fill,
                width: 128),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).appBarTheme.backgroundColor,
              ),
              onPressed: onPressed,
              child: Text("Ok!"),
            )
          ],
        ),
      ),
    );
  }
}
