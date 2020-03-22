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
  CardType selectedCardType = CardType.MALE;
  int height = 60;
  int weight = 160;
  int age = 25;

  Color getCardColor(CardType gender) {
    return gender == selectedCardType ? kActiveCardColor : kInactiveCardColor;
  }

  void handleChanged(double value) {
    setState(() {
      height = value.round();
    });
  }

  void handleWeightChange(int amount) {
    if (weight - amount >= 0 && weight + amount < 500) {
      setState(() {
        weight += amount;
      });
    }
  }

  void handleAgeChange(int amount) {
    if (age - amount >= 0 && age + amount < 200) {
      setState(() {
        age += amount;
      });
    }
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
                    color: kActiveCardColor,
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
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                            onChanged: handleChanged,
                            value: height.toDouble(),
                            min: 20.0,
                            max: 120.0,
                          ),
                        )
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
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kValueLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () => handleWeightChange(-1),
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () => handleWeightChange(1),
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kValueLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () => handleAgeChange(-1),
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressed: () => handleAgeChange(1),
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.onPressed, this.child, this.icon}) {}

  final Function onPressed;
  final Widget child;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Icon customIcon = Icon(
      this.icon,
      color: Colors.white,
    );
    return RawMaterialButton(
      child: this.icon != null ? customIcon : child,
      onPressed: onPressed != null ? onPressed : () {},
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56,
      ),
      elevation: 2.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
