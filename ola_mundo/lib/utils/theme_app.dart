import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_app.g.dart';

class ThemeApp = _ThemeApp with _$ThemeApp;

abstract class _ThemeApp with Store {

  @observable
  Color cadastroAppColor1 = Color.fromARGB(255, 255, 186, 47);

  @observable
  Color cadastroBackColor2 = Color.fromARGB(255, 255, 230, 197);

  @observable
  Color textColor = Color.fromARGB(255, 0, 0, 0);

  @observable
  Color backgroundTimerPage = Color.fromARGB(255, 240, 251, 255);

  @observable
  Color atualizarBackgroundpage = Color.fromARGB(255, 215, 255, 197);

  @observable
  Color atualizarAppBarColor = Color.fromARGB(255, 67, 200, 0);

  @observable
  Color atualizarBorderColor = Color.fromARGB(255, 0, 255, 30);

  @observable
  Color atualizarBorderFocusedColor = Color.fromARGB(255, 0, 160, 19);

  @observable
  Color atualizarTextButtonColor = Color.fromARGB(255, 0, 171, 20);
  
  @observable
  Color appBarTimerPageColor = Color.fromARGB(255, 50, 163, 255);

  @observable
  Color buttonTimerStartColor = Color.fromARGB(255, 11, 131, 135);

  @observable
  Color buttonTimerPauseColor = Color.fromARGB(255, 154, 0, 80);

  @observable
  Color buttonPdfTextColor = Color.fromARGB(255, 255, 48, 25);

  @observable
  Color buttonBackgroundColor = Color.fromARGB(255, 255, 255, 255);

  @observable
  Color borderColor = Color.fromARGB(255, 255, 170, 0);

  @action
  void setcadastroAppColor1(Color color) {
    cadastroAppColor1 = color;
  }

  @action
  void setcadastroBackColor2(Color color) {
    cadastroBackColor2 = color;
  }

  @action
  void setTextColor(Color color) {
    textColor = color;
  }

  @action
  void setBackgroundTimerPage(Color color) {
    backgroundTimerPage = color;
  }

  @action
  void setAtualizarBackgroundpage(Color color) {
    atualizarBackgroundpage = color;
  }

  @action
  void setAtualizarAppBarColor(Color color) {
    atualizarAppBarColor = color;
  }

  @action
  void setAtualizarBorderColor(Color color) {
    atualizarBorderColor = color;
  }

  @action
  void setAtualizarBorderFocusedColor(Color color) {
    atualizarBorderFocusedColor = color;
  }

  @action
  void setAtualizarTextButtonColor(Color color) {
    atualizarTextButtonColor = color;
  }

  @action
  void setAppBarTimerPageColor(Color color) {
    appBarTimerPageColor = color;
  }

  @action
  void setButtonTimerStartColor(Color color) {
    buttonTimerStartColor = color;
  }

  @action
  void setButtonTimerPauseColor(Color color) {
    buttonTimerPauseColor = color;
  }

  @action
  void setButtonPdfTextColor(Color color) {
    buttonPdfTextColor = color;
  }

  @action
  void setButtonBackgroundColor(Color color) {
    buttonBackgroundColor = color;
  }

  @action
  void setBorderColor(Color color) {
    borderColor = color;
  }
}