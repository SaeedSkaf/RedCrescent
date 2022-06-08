import 'package:flutter/material.dart';
import 'package:sarc/core/locator.dart';
import 'package:sarc/core/router.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'change_password_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  _ChangePasswordView createState() => _ChangePasswordView();
}

class _ChangePasswordView extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    final mdw = MediaQuery.of(context).size.width;
    final mdh = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        builder: (context, model, _) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text(""),
                    backgroundColor: Colors.red[600],
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          locator<NavigationService>()
                              .clearStackAndShow(Routes.loginView);
                        },
                      )
                    ]),
                body: SingleChildScrollView(
                    child: Form(
                  key: model.form,
                  child: Stack(children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: mdh * 0.06),
                          Container(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              controller: model.username,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'يجب إدخال اسم المستخدم';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.person,
                                    color: Color.fromARGB(160, 255, 0, 0)),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                labelText: 'اسم المستخدم',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(75, 0, 0, 0),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              controller: model.passOld,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'يجب إدخال كلمة المرور';
                                }
                                return null;
                              },
                              obscureText: model.isObscureFirst,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(model.isObscureFirst
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        model.isObscureFirst =
                                            !model.isObscureFirst;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                labelText: 'كلمة المرور القديمة',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(75, 0, 0, 0),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              controller: model.pass,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'يجب إدخال كلمة المرور';
                                }
                                return null;
                              },
                              obscureText: model.isObscureSecond,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(model.isObscureSecond
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        model.isObscureSecond =
                                            !model.isObscureSecond;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                labelText: 'كلمة المرور الجديدة',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(75, 0, 0, 0),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              controller: model.confirmPass,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'يجب إدخال كلمة المرور';
                                }
                                if (val != model.pass.text) {
                                  return 'كلمة المرور غير مطابقة';
                                }
                                return null;
                              },
                              obscureText: model.isObscureThird,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(model.isObscureThird
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        model.isObscureThird =
                                            !model.isObscureThird;
                                      });
                                    }),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                labelText: 'تأكيد كلمة المرور ',
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(75, 0, 0, 0),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: ButtonTheme(
                                minWidth: mdh,
                                height: 52.0,
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.red.shade400,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  onPressed: () async {
                                    if (model.form.currentState!.validate()) {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          });
                                      var result = await model
                                          .confirmChanagePassword(
                                              model.username.text,
                                              model.passOld.text,
                                              model.confirmPass.text)
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("تنبيه",
                                                  textAlign: TextAlign.center),
                                              titleTextStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 20),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                              content: Text(result!,
                                                  textAlign: TextAlign.center),
                                            );
                                          });
                                    }
                                  },
                                  child: const Text('تعديل كلمة المرور',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ),
                        ])
                  ]),
                )))),
        viewModelBuilder: () => ChangePasswordViewModel());
  }
}
