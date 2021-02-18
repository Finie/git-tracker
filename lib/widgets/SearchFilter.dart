import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SearchFilter extends StatefulWidget {
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {

  String today = DateFormat("EEEE, dd MMMM").format(DateTime.now());

  String chosenValue;
  List listItems = ["Today", "day ago", "1 Week", "1 Month", "6 Months", "1 Year" ];
  String selectedLang;
  List listLang = ["Java", "Go Lang", " Node Js", "React Js", "Python", "C#" ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      color: Colors.white,
        padding: new EdgeInsets.only(
          left: 16.0,
          right: 16.0
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: [
            Text(today, style: TextStyle(fontSize: 20.0,color: Colors.black26,),),
          ],
        ),
        TextField(
          style: TextStyle(
            fontSize: 20.0,
            color:Color.fromRGBO(51,51,51, 100)
          ),
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            fillColor: Color.fromRGBO(236,243,249, 100),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(40.0)
              ),
              borderSide: BorderSide.none
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            DropdownButtonHideUnderline(child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconEnabledColor: Color.fromRGBO(51,51,51, 100),
                hint: Text("Date",overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),)),
                value: chosenValue,
                onChanged: (newValue){
                  setState(() {
                    chosenValue= newValue;
                  });
                  },
                items: listItems.map((item){
                  return DropdownMenuItem(
                    child: Text(item,style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),)),
                    value: item,
                  );
                }).toList(),
              ),
              )),


            DropdownButtonHideUnderline(child: ButtonTheme(
              alignedDropdown: true,
              padding: EdgeInsets.all(0.0),
              child: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconEnabledColor: Color.fromRGBO(51,51,51, 100),
                hint: Text("Filter by",style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),)),
                value: selectedLang,
                onChanged: (newValue){
                  setState(() {
                    selectedLang= newValue;
                  });
                },
                items: listLang.map((item){
                  return DropdownMenuItem(
                    child: Text(item, style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),)),
                    value: item,
                  );
                }).toList(),
              ),
            )),
            Container(
              padding: EdgeInsets.only(
                bottom: 12.0
              ),
              child:Container( width: MediaQuery.of(context).size.width * 0.13, child: Text("iOS",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),))),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 12.0
              ),
              child: Container(width: MediaQuery.of(context).size.width * 0.20, child: Text("Xcode",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20.0,color:Color.fromRGBO(126,158,181, 100),))),
            )
          ],
        )
      ],
      )
    );
  }
}
