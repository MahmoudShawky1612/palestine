import 'package:flutter/cupertino.dart';

import 'circle_avatar.dart';

class CircleAvatarHome extends StatelessWidget {
  const CircleAvatarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Circle_Avatar(
      backgroundImage: AssetImage('assets/images/OIP (1).jpg'),
      radius: 30,
    );
  }
}
