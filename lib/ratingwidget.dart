import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inspection_app/dto/curbappealdto.dart';


class CustomRatingWidget extends StatefulWidget {
  CurbAppealDTO _curbAppealDTO;

  CustomRatingWidget(this._curbAppealDTO);


  CurbAppealDTO get curbAppealDTO => _curbAppealDTO;

  set curbAppealDTO(CurbAppealDTO value) {
    _curbAppealDTO = value;
  }

  @override
  createState() => new CustomRatingWidgetState();
}

class CustomRatingWidgetState extends State<CustomRatingWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child:Text(
                "Your Rating: ${widget._curbAppealDTO.ratingLabel}",
                style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
              child: Icon(widget._curbAppealDTO.ratingIcon,
                color: widget._curbAppealDTO.ratingColor,
                size: 75,
              ),
            ),
            Container(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.redAccent.withOpacity(0.5),
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 2.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
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
                  max: 6.0,
                  divisions: 6,
                  value: widget._curbAppealDTO.rating,
                  // inactiveColor: Colors.lightBlue,
                  label: "${widget._curbAppealDTO.ratingLabel}",
                  onChanged: (newValue) {
                    setState(() {
                      widget._curbAppealDTO.rating = newValue;
                      print(Text("${widget._curbAppealDTO.ratingLabel}"));
                    });
                  },
                ),
              ),
            ),
          ],
        )
    );
  }
}

