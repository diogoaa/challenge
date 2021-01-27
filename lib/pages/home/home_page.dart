import 'package:challenge/helpers/date_helper.dart';
import 'package:challenge/helpers/secure_storage.dart';
import 'package:challenge/helpers/user_helper.dart';
import 'package:challenge/models/weather_model.dart';
import 'package:challenge/store/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeStore();

  @override
  void initState() {
    _controller.findWeathers();
    _controller.syncData();
    super.initState();
  }

  Widget cardWeather({@required Weather weather}) {
    return Column(
      children: <Widget>[
        Text(
          '${DateHelper.convertDate(weather.date)} - ${DateHelper.getWeekDay(weather.date)}',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          weather.summary,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: Text(
                '${weather.temperatureC} graus Celsius',
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Text(
                '${weather.temperatureF} graus Fahrenheit',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listagem'), actions: [
        IconButton(
          icon: Text('Sair'),
          onPressed: () {
            UserHelper.removeUser();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () => _controller.findWeathers(isRefresh: true),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Observer(builder: (_) {
              return _controller.searchingWeathers
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Text(
                            '${_controller.weathers.length} Registros encontrados'),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                          itemCount: _controller.weathers.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(
                            height: 20,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return cardWeather(
                              weather: _controller.weathers[index],
                            );
                          },
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
