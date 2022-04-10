import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {

  String name = "Nome";
  String imgAvatar = "https://mundoavatar.com.br/wp-content/uploads/2021/07/avatar-filme.jpeg";
  String birthDate = "Data";

  void alterarDados() {
    name = "Lucas";
    imgAvatar = "https://t.ctcdn.com.br/e3MPpitt4-XeWffEDYVtbv_NJnQ=/512x288/smart/filters:format(webp)/i387896.jpeg";
    birthDate = "15/09/2008";
    notifyListeners();
  }

  void alterarNome() {
    name = "Academia do flutter";
    notifyListeners();
  }

  void alterarImgAvatar() {
    imgAvatar = "https://mundoavatar.com.br/wp-content/uploads/2021/07/avatar-filme.jpeg";
    notifyListeners();
  }

  void alterarBirthDate() {
    birthDate = "11/12/2014";
    notifyListeners();
  }

  void alterarNameAndBirthDate() {
    birthDate = "19/99/2019";
    name = "Alterado tudoo";
    notifyListeners();
  }
}