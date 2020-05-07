import 'package:find_seat/api/login_api.dart';
import 'package:find_seat/model/user.dart';
import 'package:find_seat/notifier/auth_notifier.dart';
import 'package:find_seat/presentation/MainWidgetsCollection/widget_logo_findseat.dart';
import 'package:find_seat/presentation/MainWidgetsCollection/widget_spacer.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    if (!formKey.currentState.validate()) {
      return;
    }

    formKey.currentState.save();

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
        labelStyle: TextStyle(color: Colors.white54),
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
        labelStyle: TextStyle(color: Colors.white54, fontFamily: "Poppins-Medium"),
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
        decoration: BoxDecoration(
          //color: Colors.blueAccent,
        //
          color: Colors.lightBlueAccent,

          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],

          ),

        ),

        child: Form(


          autovalidate: true,
          key: formKey,
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
                    buttonColor: Colors.white,
                    minWidth: 200,
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        ' ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
                        style: TextStyle(fontSize: 20, color: Colors.blueAccent),
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
                    buttonColor: Colors.white,
                    minWidth: 200,
                    child: RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      onPressed: () => _submitForm(),
                      child: Text(
                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
                        style: TextStyle(fontSize: 20, color: Colors.blueAccent),
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
