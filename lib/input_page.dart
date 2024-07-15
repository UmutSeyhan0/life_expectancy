import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'icon_gender.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double smokedCigarette = 0.0;
  double sport = 0.0;
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIFE EXPECTANCY',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton('HEIGHT'),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlinedButton('WEIGHT'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  children: [
                    FittedBox(
                        child: Text('How many days a week do you exercise?',
                            style: kTextStyle),
                        fit: BoxFit.scaleDown),
                    Text(sport.round().toString(), style: kNumberStyle),
                    Slider(
                        min: 0,
                        max: 7,
                        value: sport,
                        activeColor: Colors.lightBlue,
                        onChanged: (double newValue) {
                          setState(() {
                            sport = newValue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                  child: Column(
                children: [
                  Text('how many smokes each day?', style: kTextStyle),
                  Text(smokedCigarette.round().toString(), style: kNumberStyle),
                  Slider(
                    min: 0,
                    max: 30,
                    activeColor: Colors.lightBlue,
                    value: smokedCigarette,
                    onChanged: (double newValue) {
                      setState(() {
                        smokedCigarette = newValue;
                      });
                    },
                  )
                ],
              )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'WOMAN';
                        });
                      },
                      child: MyContainer(
                        color: selectedGender == 'WOMAN'
                            ? Colors.lightBlue[100]
                            : Colors.white,
                        child: IconGender(
                          gender: 'WOMAN',
                          icon: FontAwesomeIcons.venus,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'MAN';
                        });
                      },
                      child: MyContainer(
                        color: selectedGender == 'MAN'
                            ? Colors.lightBlue[100]
                            : Colors.white,
                        child: IconGender(
                          gender: 'MAN',
                          icon: FontAwesomeIcons.mars,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                            weight: weight,
                            height: height,
                            selectedGender: selectedGender,
                            sport: sport,
                            smokedCigarette: smokedCigarette))));
              },
              child: Text(
                'Caltulate',
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowOutlinedButton(
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: -1,
            child: Text(
              label,
              style: kTextStyle,
            )),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'HEIGHT' ? height.toString() : weight.toString(),
            style: kNumberStyle,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(36, 36),
                padding: EdgeInsets.symmetric(horizontal: 5),
                side: BorderSide(color: Colors.lightBlue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  label == 'HEIGHT' ? height++ : weight++;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.black54,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(36, 36),
                side: BorderSide(color: Colors.lightBlue),
                padding: EdgeInsets.symmetric(horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  label == 'HEIGHT' ? height-- : weight--;
                });
              },
              child: Icon(
                Icons.remove,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
