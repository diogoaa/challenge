import 'package:challenge/store/authentication/authentication_store.dart';
import 'package:challenge/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = AuthenticateStore();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        extendBody: true,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            // color: Colors.green,
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.width * 0.35,
                    ),
                  ),
                  Text(
                    'Faça seu login',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _controller.loginController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value.isEmpty) return 'Campo obrigatório';

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Informe seu usuário',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value.isEmpty) return 'Campo obrigatório';

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Informe sua senha',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Observer(
                    builder: (_) {
                      return _controller.loggingIn
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (!_formKey.currentState.validate()) return;

                                  final user = await _controller.login();

                                  if (user == null)
                                    return CustomSnackbar.showError(
                                        'Falha no login',
                                        _scaffoldKey,
                                        context);

                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/home', (route) => false);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
