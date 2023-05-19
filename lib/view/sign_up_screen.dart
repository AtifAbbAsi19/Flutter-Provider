import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../di/module/view_model_module.dart';
import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _State();
}

class _State extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailETC;
  late TextEditingController _passwordETC;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  var _obscurePassword = ValueNotifier<bool>(true);

  // Initially password is obscure
  final bool _obscureText = true;
  var _password;

  //late SharedPrefrences sharedPreferences;

  @override
  void initState() {
    super.initState();

    _emailETC = TextEditingController();
    _passwordETC = TextEditingController();
  }

  //email Validator to Validate Password
  String? validateEmail(String text) {
    if (!(text.length > 5) && !(text.contains('@')) && text.isNotEmpty) {
      return "Enter a valid email address!";
    }
    return null;
  }

//Password Validator to Validate Password
  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    var authViewModel = ViewModel.authViewModel(context);

    final height = MediaQuery.of(context).size.height * 1; //full screen size

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
              controller: _emailETC,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                //FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
              decoration: const InputDecoration(
                  hintText: "Email",
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email))),
          ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordETC,
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscurePassword.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_clock_sharp),
                    suffixIcon: InkWell(
                        onTap: () =>
                            _obscurePassword.value = !_obscurePassword.value,
                        child: Icon(_obscurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                  ),
                );
              }),
          SizedBox(height: height * .1),
          RoundedButton(
            key: null,
            loading: authViewModel.loading,
            title: "Signup",
            onPress: () {
              if (_emailETC.text.isEmpty) {
                Utils.snackBar("Please enter email", context);
              } else if (_passwordETC.text.isEmpty) {
                Utils.flushBarErrorMessage("Please enter Password", context);
              } else if (_passwordETC.text.length < 4) {
                Utils.flushBarErrorMessage(
                    "Please enter valid password", context);
              } else {
                Map data = {
                  "email": _emailETC.text.toString(),
                  "password": _passwordETC.text.toString(),
                };

                //1) Call API
                //2) navigate to next screen
                authViewModel.signup(data, context);
              }
            },
          ),
          SizedBox(height: height * .0185),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: const Text("already have account? Login "),
          )
        ],
      )),
    );
  }
}
