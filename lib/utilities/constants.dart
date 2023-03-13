import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Sono',
  fontSize: 20.0,
);
const kCityScreenTitle = TextStyle(
  fontFamily: 'Finlandica',
  fontSize: 100.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'FjallaOne',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'FjallaOne',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldInputStyle = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Color.fromARGB(255, 196, 163, 163),
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
