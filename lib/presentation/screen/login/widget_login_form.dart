import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        //Navigator.pushNamed(context, Router.HOME);
      }catch(e){
          print(e.message);
      }
    }
  }
}
