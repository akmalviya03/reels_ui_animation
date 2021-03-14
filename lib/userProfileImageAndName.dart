import 'package:flutter/material.dart';

class UserProfileImageAndName extends StatelessWidget {
  const UserProfileImageAndName({
    Key key,
    @required this.iconsHeight,
  }) : super(key: key);

  final double iconsHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: iconsHeight,
            height: iconsHeight,
            child: Image.network(
              'https://i.pinimg.com/originals/d4/73/76/d473761560fc502029d30a466704e07c.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(iconsHeight * 0.2, 0, 0, 0),
          child: Text(
            'john_doe',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: iconsHeight*0.35),
          ),
        )
      ],
    );
  }
}
