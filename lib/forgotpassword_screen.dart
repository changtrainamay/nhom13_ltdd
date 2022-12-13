import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('images/logo.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Chúng tôi sẽ gửi đường link đổi mật khẩu vào địa chỉ email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Thông báo'),
                          content: Text(
                              'Email đã được gửi. Vui lòng kiểm tra Email!'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK')),
                          ],
                        );
                      });
                },
                child: Text('Gửi email'),
                color: Colors.red,
              ),
            ],
          ),
          //email
        ),
      ),
    );
  }
}
