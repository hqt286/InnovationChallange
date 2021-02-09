import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  double sliderValue;
  Color feedBackColor;
  RatingBar (this.feedBackColor, this.sliderValue) {
    if (sliderValue == 0.0) {
      feedBackColor = Colors.green;
    }
    else if (sliderValue == 1.0) {
      feedBackColor = Colors.black;
    }
    else if (sliderValue == 2.0) {
      feedBackColor = Colors.yellow;
    }
    else if (sliderValue == 3.0) {
      feedBackColor = Colors.blueGrey;
    }
    else if (sliderValue == 4.0) {
      feedBackColor = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  "Your Rating: $sliderValue",
                  style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 20),
                )
            ),
          ),

          Container(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
                min: 0.0,
                max: 5.0,
                divisions: 5,
                value: sliderValue,
                activeColor: feedBackColor,
                inactiveColor: Colors.lightBlue,
                label: "$sliderValue",
              ),
            ),
          ),
        ],
      );  }
}