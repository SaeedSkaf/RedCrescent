import 'package:flutter/material.dart';
import 'package:sarc/ui/login/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String message = " ";
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;

    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                // resizeToAvoidBottomInset: false,
                body: Stack(children: <Widget>[
              buildPositionedTop(mdw),
              // buildPositionedBottom(mdw),
              SizedBox(
                height: 500,
                child: Column(children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 60),
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                  ),
                  if (!isKeyboard)
                    Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/images/3.png'),
                            fit: BoxFit.fill,
                          ),
                        ))
                ]),
              ),
              const SizedBox(
                height: 300,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 190),
                  height: mdh * 0.7,
                  width: mdw * 0.75,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              prefixIcon: const Icon(Icons.person,
                                  color: Color.fromARGB(160, 255, 0, 0)),
                              labelText: 'اسم المستخدم',
                              labelStyle: const TextStyle(color: Colors.black),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(75, 0, 0, 0),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            controller: model.username,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: model.isObscure,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(model.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    model.isObscure = !model.isObscure;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            prefixIcon: const Icon(Icons.lock,
                                color: Color.fromARGB(160, 255, 0, 0)),
                            labelText: 'كلمة المرور',
                            labelStyle: const TextStyle(color: Colors.black),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(75, 0, 0, 0),
                                width: 2.0,
                              ),
                            ),
                          ),
                          controller: model.password,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 14),
                            child: Text(
                              message,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.red),
                            )),
                        const SizedBox(
                          height: 3,
                        ),
                        ButtonTheme(
                            minWidth: 160.0,
                            height: 50.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.red.shade400,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              onPressed: () async {
                                await model.login(
                                    model.username.text, model.password.text);

                                setState(() {
                                  message = model.errorMessage;
                                });
                              },
                              child: const Text('تأكيـــد',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            )),
                        TextButton(
                            child: const Text("تغيير كلمة المرور",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline)),
                            onPressed: () {
                              model.navToChangePassword();
                            }),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: mdh - 30),
                  child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                          children: <TextSpan>[
                        const TextSpan(text: "Copyrighr © 2022 "),
                        TextSpan(
                            text: "IT",
                            style: TextStyle(
                                color: Colors.red.shade400,
                                fontWeight: FontWeight.bold)),
                        const TextSpan(text: ". All Rights Reserved")
                      ]))),
            ]))),
        viewModelBuilder: () => LoginViewModel());
  }
}

Positioned buildPositionedBottom(double mdw) {
  return Positioned(
      top: 580,
      right: mdw / 1.6,
      child: Container(
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Colors.red[400])));
}

Positioned buildPositionedTop(double mdw) {
  return Positioned(
      child: Transform.scale(
          scale: 1.3,
          child: Transform.translate(
              offset: Offset(0, -mdw / 1.7),
              child: Container(
                height: mdw,
                width: mdw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mdw),
                    color: Colors.red[400]),
              ))));
}
