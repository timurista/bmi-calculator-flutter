import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum CardType { MALE, FEMALE }

class _InputPageState extends State<InputPage> {
  CardType selectedCardType;
  int height = 180;

  Color getCardColor(CardType gender) {
    return gender == selectedCardType ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    handler: () {
                      setState(() {
                        selectedCardType = CardType.MALE;
                      });
                    },
                    color: getCardColor(CardType.MALE),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    handler: () {
                      setState(() {
                        selectedCardType = CardType.FEMALE;
                      });
                    },
                    color: getCardColor(CardType.FEMALE),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kValueLabelStyle),
                            SizedBox(
                              width: 4,
                            ),
                            Text('in', style: kLabelTextStyle)
                          ],
                        ),
                        Slider(value: height.toDouble(), min: 120.0, max: 220.0)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
