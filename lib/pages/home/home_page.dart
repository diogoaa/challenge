import 'package:challenge/helpers/date_helper.dart';
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
      appBar: AppBar(
        title: Text('Clima'),
        actions: [
          FlatButton(
            child: Text('Sair'),
            onPressed: () {
              UserHelper.removeUser();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
        ],
      ),
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
                        // FlatButton(
                        //   child: Text('Usar Token'),
                        //   onPressed: () {
                        //     _controller.useAuth = !_controller.useAuth;
                        //     _controller.findWeathers();
                        //   },
                        // ),
                        Text(
                          '${_controller.weathers.length} Registros encontrados',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Puxe para atualizar',
                          style: TextStyle(fontSize: 10),
                        ),
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
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          child: Icon(Icons.build_circle),
          tooltip: 'Usar token',
          backgroundColor: _controller.useAuth
              ? Theme.of(context).accentColor.withOpacity(0.7)
              : Colors.grey.withOpacity(0.7),
          onPressed: () {
            _controller.useAuth = !_controller.useAuth;
            _controller.findWeathers();
          },
        );
      }),
    );
  }
}
