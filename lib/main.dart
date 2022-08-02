import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String useremail = "test@email.com";
  String userpass = "pass123";
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ยินดีต้อนรับเข้าสู่ระบบ",
                    style: GoogleFonts.mitr(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFD3D3D3)),
                    child: TextField(
                      controller: email,
                      cursorColor: Color(0xFF9F9F9F),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "อีเมล",
                          hintStyle: GoogleFonts.mitr(color: Color(0xFF424242)),
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFF424242),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFD3D3D3)),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      cursorColor: Color(0xFF9F9F9F),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "รหัสผ่าน",
                          hintStyle: GoogleFonts.mitr(color: Color(0xFF424242)),
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xFF424242),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: size.width * 0.8,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "ลืมรหัสผ่านใช่หรือไม่",
                          style: GoogleFonts.mitr(color: Color(0xFFFFC800)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (email.text == useremail &&
                          userpass == password.text) {
                        // Navigator.popAndPushNamed(context, '/dashboard');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Dashboard())));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Login'),
                                content:
                                    const Text("Invalid E-mail or password"),
                                actions: [
                                  TextButton(
                                      onPressed: (() => Navigator.pop(context)),
                                      child: const Text("OK"))
                                ],
                              );
                            });
                      }

                      // Navigator.popAndPushNamed(context, '/dashboard');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFFC800),
                      ),
                      width: size.width * 0.8,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: GoogleFonts.mitr(
                              color: Color(0xFFFFFFFF), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
