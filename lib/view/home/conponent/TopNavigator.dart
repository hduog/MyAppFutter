import 'package:courses_app/constains/constains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar TopNavigator(context) => AppBar(
      backgroundColor: const Color.fromARGB(255, 121, 169, 192),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
          color: kTextColor,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          color: kTextColor,
        ),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
