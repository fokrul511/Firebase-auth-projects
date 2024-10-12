import 'package:flutter/material.dart';

class UIHelper {
  ///Custom Textfilds
  static customTextFild(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool isHide,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isHide,
        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: text,
        ),
      ),
    );
  }

  ///Custom Elevetaed button
  static customeButton(VoidCallback onTap, String text) {
    return SizedBox(
      height: 44,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }

  ///Custom TextButton
  static customTextButton(VoidCallback onTap, String text) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }

  ///Custom alart Dialog.....
  static customAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
