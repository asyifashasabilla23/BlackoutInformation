import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plnfix/user/menuuser.dart';

void main() {
  runApp(NotifySukses());
}

class NotifySukses extends StatelessWidget {
  static const nameRoute = '/notify_sukses';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Color(0xFF5EABA7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 343,
                height: 500,
                child: IconButton(
                  icon: Image.asset('images/bglampusukses.png'),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: double.infinity,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Silahkan kembali ke menu utama',
                    style: TextStyle(
                        color: Color(0xFF665C5C),
                        fontSize: 14,
                        fontFamily: 'poppins-regular'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
