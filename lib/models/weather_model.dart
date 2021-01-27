class Weather {
  String date;
  int temperatureC;
  int temperatureF;
  String summary;

  Weather({this.date, this.temperatureC, this.temperatureF, this.summary});

  Weather.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    temperatureC = json['temperatureC'];
    temperatureF = json['temperatureF'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['temperatureC'] = this.temperatureC;
    data['temperatureF'] = this.temperatureF;
    data['summary'] = this.summary;
    return data;
  }
}
