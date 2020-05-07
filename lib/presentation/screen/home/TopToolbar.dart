import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 55,
      child: Row(
        children: <Widget>[
          _profileDp(),
          _profileName(),
        ],
      ),
    );
  }

  _profileName() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('EAP Films', style: FONT_CONST.SEMIBOLD_WHITE_16),
          Opacity(
            child: Row(
              children: <Widget>[
                Text('Kasun', style: FONT_CONST.SEMIBOLD_WHITE_16),
              ],
            ),
            opacity: 0.5,
          )
        ],
      ),
    );
  }

  _profileDp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(19)),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          image: DecorationImage(image: AssetImage("images/boy.jpg")),
        ),
      ),
    );
  }
}
