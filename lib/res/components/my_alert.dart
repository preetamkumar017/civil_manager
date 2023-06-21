
import 'package:civil_manager/res/components/round_button.dart';
import 'package:flutter/material.dart';

class MyAlert {
  static myCallAlert(BuildContext context, data) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Please confirm '),
        content: const Text('Make sure you want to make this call!!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

//'Your Device not register With us!! send request to register'
  static deviceRequest(BuildContext context, data) async {
    return showDialog<String>(
      context: context,
      // builder: (context) => CupertinoAlertDialog(
      //   title: const Text('Alert',
      //       style:
      //           TextStyle(color: Color.fromARGB(255, 240, 0, 0), fontSize: 16)),
      //   content: const Text(
      //       "Your Device has not been  registered...\n Send registration request to admin...",
      //       style: TextStyle(color: Colors.black, fontSize: 16)),
      //   actions: [
      //     CupertinoDialogAction(child: const Text('Cancel'), onPressed: () {}),
      //     CupertinoDialogAction(
      //         child: const Text('Send Request'), onPressed: () {}),
      //   ],
      // ),

      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert!',
            style: TextStyle(color: Color.fromARGB(255, 240, 0, 0))),
        content: const Text(
            "Your Device has not been registered...\nSend registration request to admin...",
            style: TextStyle(color: Colors.black, fontSize: 16)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          RoundButton(
              title: 'Send Request',
              onPress: () {
                data['req_type'] = "device_register";
              })
        ],
      ),
    );
  }
}
