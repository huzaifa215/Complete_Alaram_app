import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    //var formattedTime= DateFormat('HH:mm').format(now);
    var timezoneString = now.timeZoneOffset
        .toString()
        .split('.')
        .first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);


    return Container(
      alignment: Alignment.center,
      color: Color(0xFF2D2F41),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            //1
            Flexible(
              flex: 2,
              fit: FlexFit.loose, // adjust the layouts
              child: Text('Clock', style:
              TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24
              ),
              ),
            ),
            //2


            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formattedTime, style:
                  TextStyle(
                      fontFamily: 'avenir',
                      //fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 64
                  ),
                  ),
                  Text(formattedDate, style:
                  TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 20
                  ),
                  ),
                  // SizedBox(height: 16),
                ],
              ),
            ),

            Flexible(
                flex: 3,
                fit: FlexFit.loose,
                child: ClockView(size: MediaQuery
                    .of(context)
                    .size
                    .height / 4)),
            //SizedBox(height: 32),
            Text('Timezone', style:
            TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 24
            ),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Icon(Icons.language,
                  color: Colors.white,),
                SizedBox(width: 16),
                Text('UTC' + offsetSign + timezoneString, style:
                TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.white,
                    fontSize: 14
                ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}






