class User {
  String login;
  String token;
  int idEmpresa;
  int idUsuario;
  String dataExpiracao;
  int idPessoa;

  User(
      {this.login,
      this.token,
      this.idEmpresa,
      this.idUsuario,
      this.dataExpiracao,
      this.idPessoa});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    token = json['token'];
    idEmpresa = json['idEmpresa'];
    idUsuario = json['idUsuario'];
    dataExpiracao = json['dataExpiracao'];
    idPessoa = json['idPessoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['token'] = this.token;
    data['idEmpresa'] = this.idEmpresa;
    data['idUsuario'] = this.idUsuario;
    data['dataExpiracao'] = this.dataExpiracao;
    data['idPessoa'] = this.idPessoa;
    return data;
  }
}
