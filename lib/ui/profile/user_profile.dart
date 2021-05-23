import 'package:devicepe_client/utils/colors.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteText,
      child: Center(
        child: Image(
          image: AssetImage('assets/images/coming_soon.png'),
        ),
      ),
    );
  }
}
