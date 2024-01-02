import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plnfix/admin/menuadmin.dart';
import 'package:plnfix/app/controllers/auth_controller.dart';
import 'package:plnfix/user/menuuser.dart';

void main() {
  runApp(DaftarAdmin());
}

class DaftarAdmin extends StatefulWidget {
  static const nameRoute = '/daftaradmin';

  @override
  State<DaftarAdmin> createState() => _DaftarAdminState();
}

class _DaftarAdminState extends State<DaftarAdmin> {
  final edtNama = TextEditingController();

  final edtEmail = TextEditingController();

  final edtPassword = TextEditingController();

  bool hidePassword = true;

  final authC = Get.find<AuthController>();

  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  void initState() {
    hidePassword = true;
    super.initState();
  }
  @override
  void dispose() {
    edtNama.dispose();
    edtEmail.dispose();
    edtPassword.dispose();
    hidePassword = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2A4F63),
        title: Text("Daftar Sebagai Admin"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF5AADA2),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset("images/iconheader.png"),
            const Text(
              'Blackout Information',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "poppins-regular",
                  color: Color(0xFF707070)),
            ),
            SizedBox(
              height: 61,
            ),
            Text(
              'Nama',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppinsbold',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: edtNama,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nama....',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppinsbold',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: edtEmail,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Email....',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppinsbold',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: edtPassword,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Password....',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye,
                          color: const Color(0xFF4F5E71),
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 123,
              height: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF43AA6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    authC
                        .signup_admin(
                            email: edtEmail.text,
                            password: edtPassword.text,
                            nama: edtNama.text)
                        .then((value) {
                      if (value == "weak-password") {
                        Get.snackbar("Auth", "Weak Password");
                      } else if (value == "email-already-in-use") {
                        Get.snackbar("Auth", "email-already-in-use");
                      } else if (value == 1) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MenuAdmin.nameRoute, (route) => false);
                      }
                    });
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "poppins-regular",
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
