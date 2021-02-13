import 'package:flutter/material.dart';
import 'package:inspection_app/dto/commentdto.dart';


class CustomDropDown extends StatefulWidget {

  String _selectValue;


  List _selections = ["Improving", "Stable", "Declining","Unknown"];

  CustomDropDown(this._selectValue);

  @override
  createState() => CustomDropDownState();

  String get selectValue => _selectValue;

  set selectValue(String value) {
    _selectValue = value;
  }
}

class CustomDropDownState extends State<CustomDropDown> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton(
        hint: Text("Select Items: "),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 16,
        isExpanded: true,
        underline:SizedBox(),
        style: TextStyle(
            color: Colors.black,
            fontSize: 16
        ),
        value: widget._selectValue,
        onChanged: (newValue) {
          setState(() {
            widget._selectValue = newValue;
          });
        },
        items: widget._selections.map(
                (valueItem){
              return DropdownMenuItem(
                value: valueItem,
                child: Text (valueItem),
              );
            }
        ).toList(),
      ),
    );
  }
}
