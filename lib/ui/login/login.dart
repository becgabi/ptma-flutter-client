import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptma_flutter_client/di/di_config.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list.dart';
import 'package:ptma_flutter_client/ui/login/login_cubit.dart';
import 'package:ptma_flutter_client/ui/util.dart';

const LOGIN_PAGE = "/login";

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                Center(
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 100.0,
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  validator: _validateRequired,
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !this._showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        this._showPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                            () => this._showPassword = !this._showPassword);
                      },
                    ),
                  ),
                  validator: _validateRequired,
                ),
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login has failed!")),
                      );
                    } else if (state is Loading) {
                      context.centerProgressBar;
                    } else if (state is LoggedIn) {
                      Navigator.popAndPushNamed(context, APPOINTMENT_LIST_PAGE);
                    }
                  },
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 40.0,
                          width: double.infinity,
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                if (_isFormValid()) {
                                  var email = _emailController.text;
                                  var password = _passwordController.text;
                                  context
                                      .read<LoginCubit>()
                                      .login(email, password);
                                }
                              },
                              icon: Icon(Icons.login),
                              label: Text("Login")),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }
}
