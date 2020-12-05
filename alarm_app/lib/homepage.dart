import 'package:alarm_app/clock_page.dart';
import 'package:alarm_app/enums.dart';
import 'package:alarm_app/menu_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

import 'package:provider/provider.dart';

import 'package:flutter/src/widgets/framework.dart';


import 'alarm_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    // var now = DateTime.now();
    // var formattedTime = DateFormat('HH:mm').format(now);
    // var formattedDate = DateFormat('EEE, d MMM').format(now);
    // //var formattedTime= DateFormat('HH:mm').format(now);
    // var timezoneString = now.timeZoneOffset
    //     .toString()
    //     .split('.')
    //     .first;
    // var offsetSign = '';
    // if (!timezoneString.startsWith('-')) offsetSign = '+';
    // print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildmainButton(currentMenuInfo))
                .toList(),
          ),

          //divider vertical
          VerticalDivider(
              color: Colors.white54,
              width: 1),
          //Wrap with expanded widget
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget child) {
                  if (value.menuType == MenuType.clock)
                    return ClockPage();
                  else if (value.menuType == MenuType.alarm)
                    return AlarmPage();
                  else
                    return Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(text: 'Upcoming Tutorial\n'),
                            TextSpan(
                              text: value.title,
                              style: TextStyle(fontSize: 48),
                            ),
                          ],
                        ),
                      ),
                    );
                },
            ),
          ),
        ],
      ),
    );
  }

  //

  //function
  Widget buildmainButton(MenuInfo currentMenuInfo) {
    // ignore: missing_required_param
    return Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget child){
          return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(32))
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: currentMenuInfo.menuType == value.menuType ?
            Color(0xFF2D2F41): Colors.transparent,
            // if the title is equal to clock make is red else for all it make it transparent

            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context ,listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.6,),
                SizedBox(height: 16),
                Text(currentMenuInfo.title ?? '',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white, fontSize: 14)
                ),
              ],
            ),
          );
        },

    );
  }

//   buildMenuButton(currentMenuInfo) {}
// }


}
