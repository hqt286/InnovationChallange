import 'package:flutter/material.dart';

class InspectionGuideline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,

          iconTheme: IconThemeData(
            color: Colors.black,
          ),

          centerTitle: true,
          title: Text("Inspection Guideline",
            style: TextStyle(fontSize: 25, color: Colors.black),),
        ),

        body: SingleChildScrollView(

          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textDirection: TextDirection.ltr,
            children: [
              Align(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Photographs",
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
              ),

              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text:"MAMP will indicate the number of photographs require to be submitted which is also reflect"+
                            " in the inspection Protocol Matrix in the Guide",
                            style: TextStyle(color: Colors.black, fontSize: 16)),

                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Photographs must inclulde view of:",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Signage",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Typical building front",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Site office and clubhouse (if applicable)",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Property frontage",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),

              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Apartment interior",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Amenities",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Deferred Maintenance & Life Safety items",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "Extraordinary repair items or items requiring capital expenditure",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "All deferred maintenance and/or other critical issue not in the inspection "
                            +"report must have supporting photos submitted with the inspection form. The " + ""
                            "narrative description of the issues need to tie out to specific photographs",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "All photographs must include identifying captions",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Consulation with Property Manager/Staff",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25)),
                ),
              ),


              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "For property inspections other than walk-around inspections, the servicer must "
                            + "interview the property manager and other on-site staff to objectain information regarding the "
                            + "property's condition and performance",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),

              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "The inspector must confirm that any Life Safety repair and maintencance items note "
                            + "on the most recent property inspection have been corrected",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),

              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: "All life Safety issue must be documented in the inspection report",
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ]
                  )
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bit.ly/3dbOYF0"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),


              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bit.ly/2NuELZq"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://bit.ly/3rZ6rVD"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),


            ],
          ),
        )
    );
  }



}
