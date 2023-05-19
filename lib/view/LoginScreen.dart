import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../di/module/network_module.dart';
import '../di/module/view_model_module.dart';
import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import 'ListViewScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  //Navigator To Navigate to next Screen
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ListViewScreen(title: "Home")));
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

    // context.watch<AuthViewModel>().login(data, context)

   // final authViewModel =  Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1; //full screen size

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
            title: "Login",
            onPress: () {

              if(_emailETC.text.isEmpty){
                Utils.snackBar("Please enter email", context);
              }else if(_passwordETC.text.isEmpty){
                Utils.flushBarErrorMessage("Please enter Password", context);
              }else if(_passwordETC.text.length<6){
                Utils.flushBarErrorMessage("Please enter valid password", context);
              }else{
               // Utils.toastMessage("validated");

                Map data = {
                  "email" : _emailETC.text.toString(),
                  "password" : _passwordETC.text.toString(),
                };

                //1) Call API
                //2) navigate to next screen
                authViewModel.login(data,context);

              }


            },
          ),
          const SizedBox(height: 20),
           InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.signup);
            },
            child: Text("don't have an account? Signup "),)
        ],
      )),
    );

    //return _buildLoginView(context);

    //throw UnimplementedError();
    /* return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                key: UniqueKey(),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage("assets/images/logo_light.png"),
                    size: 120,
                  ),
                  Container(height: 50),
                  TextFormField(
                    key: UniqueKey(),
                    controller: _emailETC,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enabled: true,
                    validator: (text) {
                      if (null != text &&
                          !(text.length > 5) &&
                          text.isNotEmpty) {
                        return "Enter valid user name/email!";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter UserName/Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.black54, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.black38, width: 2)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                                color: Colors.black12, width: 2)),
                        */ /*     suffixText: "Enter User Name",
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.abc)),
                  prefixText: "Rs.",
                  prefixIcon: const Icon(Icons.email)*/ /*
                        suffixIcon: const Icon(Icons.email)),
                  ),
                  Container(key: UniqueKey(), height: 11),
                  TextFormField(
                    key: UniqueKey(),
                    //for UI testing
                    // keyboardType: TextInputType.visiblePassword,
                    controller: _passwordETC,
                    enabled: true,
                    obscureText: !_obscureText,
                    obscuringCharacter: "*",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) => validatePassword(val!),
                    onSaved: (val) => _password = val,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      errorText: validatePassword(_passwordETC.text),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.black54, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.black38, width: 2)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 2)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye)),
                    ),
                  ),
                  Container(key: UniqueKey(), height: 11),
                  OutlinedButton(
                    key: UniqueKey(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      // _formKey.currentState!.save();

                      if (_formKey.currentState!.validate()) {
                        _navigation(RoutesName.home);

                        //_navigateToNextScreen(context);
                      }else{
                        //Utils.toastMessage("invalid login");
                        Utils.flushBarErrorMessage("invalid login",context);
                       // Utils.snackBar("invalid login",context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));*/
  }

/*  Widget _buildLoginView(BuildContext context) {






    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                focusNode:  emailFocusNode,
                onFieldSubmitted: (value){
                  //FocusScope.of(context).requestFocus(passwordFocusNode);
                  Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                },
                decoration: const InputDecoration(
                  hintText:"Email",
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)
                )
              ),

              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context,value,child){
                    return  TextFormField(
                        controller: _passwordETC,
                        focusNode:  passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscurePassword.value,
                        obscuringCharacter: "*",
                        decoration: const InputDecoration(
                            hintText:"Password",
                            labelText: 'Password',
                            suffixIcon: InkWell(
                              onTap: (){
                                _obscurePassword.value = !_obscurePassword.value;
                              },
                                child: Icon(Icons.visibility)
                            ),
                        )
                    );
                  }),





            ],

      )
      ),
    );

  }*/

  @override
  void dispose() {
    // _emailETC.dispose();
    //  _passwordETC.dispose();
    // _password = null;
    super.dispose();

     _emailETC.dispose();
      _passwordETC.dispose();
      emailFocusNode.dispose();
      passwordFocusNode.dispose();

  }

  void _navigation(String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
