/*import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/home/Movie_Home.dart';
import 'package:find_seat/presentation/screen/login/home.dart';
import 'package:find_seat/presentation/screen/login/widget_btn_facebook.dart';
import 'package:find_seat/presentation/screen/login/widget_btn_google.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WidgetLoginForm extends StatefulWidget {
  @override
  _WidgetLoginFormState createState() => _WidgetLoginFormState();
}

class _WidgetLoginFormState extends State<WidgetLoginForm> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: COLOR_CONST.WHITE,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Login to your account',
                style: FONT_CONST.MEDIUM_DEFAULT_16),
          ),
          WidgetSpacer(height: 20),
          _buildTextFieldUsername(),
          WidgetSpacer(height: 14),
          _buildTextFieldPassword(),
          WidgetSpacer(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot password ?',
              style: FONT_CONST.REGULAR_GRAY4_12,
            ),
          ),
          WidgetSpacer(height: 20),
          _buildButtonLogin(),
          WidgetSpacer(height: 30),
          _buildTextOr(),
          WidgetSpacer(height: 20),
          _buildSocialLogin(),
        ],
      ),
    );
  }

  _buildSocialLogin() {
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          WidgetBtnGoogle(),
          SizedBox(width: 20),
          WidgetBtnFacebook(),
        ],
      ),
    );
  }

  _buildTextOr() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Divider(
            color: COLOR_CONST.BLACK_30,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: COLOR_CONST.WHITE,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Text(
                'Or',
                style: FONT_CONST.REGULAR_GRAY5_10,
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildButtonLogin() {

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed:()
       {
          Navigator.pushNamed(context, Router.HOME);
      }
        ,
        color: COLOR_CONST.DEFAULT,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'Login'.toUpperCase(),
          style: FONT_CONST.SEMIBOLD_WHITE_18,
        ),
      ),
    );
  }

  _buildTextFieldPassword() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: COLOR_CONST.GRAY3,
      ),

      child: Center(
        key: _formKey,
        child: TextFormField(

          style: FONT_CONST.REGULAR_GRAY1_12,
          maxLines: 1,
          keyboardType: TextInputType.text,
          obscureText: true,

          textAlign: TextAlign.left,
          // ignore: missing_return
          validator: (input) {
            if(input.length < 6){
              return 'Please enter an password';
            }
          },
          onSaved: (input) => _password = input,
          decoration: InputDecoration(
            labelText: 'Password',
            //hintText: 'Password',
          ),

        ),
      ),
    );
  }

  _buildTextFieldUsername() {
    return Container(

      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: COLOR_CONST.GRAY3,
      ),
      child: Center(
        child: TextFormField(
          style: FONT_CONST.REGULAR_GRAY1_12,
          maxLines: 1,
          // ignore: missing_return
          validator: (input) {
            if(input.isEmpty){
              return 'Please enter an email';
            }
          },
          onSaved: (input) => _email = input,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            labelText: 'Username',
            //hintText: 'Username',
          ),
        ),
      ),
    );
  }
  Future<void> signIn() async{
    //validate fields
    //login to firebase
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
       await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home1()));
        //Navigator.pushNamed(context, Router.HOME);
      }catch(e){
          print(e.message);
      }
    }
  }
}*/


import 'package:find_seat/api/food_api.dart';
import 'package:find_seat/model/user.dart';
import 'package:find_seat/notifier/auth_notifier.dart';
import 'package:find_seat/presentation/common_widgets/widget_logo_findseat.dart';
import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/utils/my_const/COLOR_CONST.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  User _user = User();

  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
    super.initState();
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);

    if (_authMode == AuthMode.Login) {
      login(_user, authNotifier);
    } else {
      signup(_user, authNotifier);
    }
  }

  Widget _buildDisplayNameField() {
    return TextFormField(
        /*height: 50,
        padding: EdgeInsets.symmetric(horizontal: 17),
    decoration: BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(10),
    color: COLOR_CONST.GRAY3,
    )*/


      decoration: InputDecoration(

        labelText: "Display Name",
        labelStyle: TextStyle(color: COLOR_CONST.GRAY3,),
        //filled: FONT_CONST.REGULAR_GRAY1_12,
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 26, color: Colors.white),
      cursorColor: Colors.white,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Display Name is required';
        }

        if (value.length < 5 || value.length > 12) {
          return 'Display Name must be betweem 5 and 12 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.displayName = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.white54),
      ),
      keyboardType: TextInputType.emailAddress,
      //initialValue: 'julian@food.com',
      style: TextStyle(fontSize: 26, color: Colors.white),
      cursorColor: Colors.white,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.white54),
      ),
      style: TextStyle(fontSize: 26, color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 5 || value.length > 20) {
          return 'Password must be betweem 5 and 20 characters';
        }

        return null;
      },
      onSaved: (String value) {
        _user.password = value;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(color: Colors.white54),
      ),
      style: TextStyle(fontSize: 26, color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }

 Widget _topScreen() {
    return Column(
      children: <Widget>[
        WidgetSpacer(height: 41),
        SizedBox(
          width: 172,
          child: WidgetLogoFindSeat(),
        ),
        WidgetSpacer(height: 40),
        Text('Expect the Unexpected', style: FONT_CONST.MEDIUM_WHITE_22),
        Text(' View & Book A Seat for a Movie ',
            style: FONT_CONST.MEDIUM_WHITE_14),
        WidgetSpacer(height: 30),
      ],
    );
  }









  @override
  Widget build(BuildContext context) {
    print("Building login screen");

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(color: Color(0xff34056D)),
        child: Form(

          autovalidate: true,
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
              child: Column(
                children: <Widget>[
                  _topScreen(),

                  SizedBox(height: 32),

                  _authMode == AuthMode.Signup ? _buildDisplayNameField() : Container(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _authMode == AuthMode.Signup ? _buildConfirmPasswordField() : Container(),
                  SizedBox(height: 32),
                  ButtonTheme(
                    minWidth: 200,
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _authMode =
                          _authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: 200,
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: () => _submitForm(),
                      child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
