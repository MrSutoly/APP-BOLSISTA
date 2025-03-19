import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_app.g.dart';

class ThemeApp = _ThemeApp with _$ThemeApp;

abstract class _ThemeApp with Store {

  // Cadastro //

  @observable
  Color cadastroAppColor1 = Color.fromARGB(255, 255, 186, 47);

  @observable
  Color cadastroBackColor2 = Color.fromARGB(255, 255, 230, 197);

  @observable
  Color borderColor = Color.fromARGB(255, 255, 170, 0);

  @observable
  Color cadastrobuttonColor = Color.fromARGB(255,255,147,52);

  //textos//

  @observable
  Color textColor = Color.fromARGB(255, 0, 0, 0);

  @observable
  Color textColor2 = Color.fromARGB(255, 255, 255, 255);

  @observable
  Color acceptColor = Color.fromARGB(255, 0, 216, 0);

  @observable
  Color declineColor = Color.fromARGB(255, 216, 22, 0);

  //atualizar //

  @observable
  Color atualizarBackgroundpage = Color.fromARGB(255, 215, 255, 197);

  @observable
  Color atualizarAppBarColor = Color.fromARGB(255, 67, 200, 0);

  @observable
  Color editIconColor = Color.fromARGB(255, 80, 221, 118);

  @observable
  Color atualizarBorderColor = Color.fromARGB(255, 0, 255, 30);

  @observable
  Color atualizarBorderFocusedColor = Color.fromARGB(255, 0, 160, 19);

  @observable
  Color atualizarTextButtonColor = Color.fromARGB(255, 0, 171, 20);
  
  //timer//

  @observable
  Color backgroundTimerPage = Color.fromARGB(255, 240, 251, 255);

  @observable
  Color appBarTimerPageColor = Color.fromARGB(255, 50, 163, 255);

  @observable
  Color buttonTimerStartColor = Color.fromARGB(255, 11, 131, 135);

  @observable
  Color buttonTimerPauseColor = Color.fromARGB(255, 154, 0, 80);

  //attachs//

  @observable
  Color buttonPdfTextColor = Color.fromARGB(255, 255, 48, 25);

  @observable
  Color deleteIconColor = Color.fromARGB(255, 255, 88, 50);

  @observable
  Color backSnackSucessColor = Color.fromARGB(255, 93, 216, 97);

  @observable
  Color backSnackfailColor = Color.fromARGB(255, 228, 69, 66);

  @observable
  Color appbarArqColor =Color.fromARGB(255, 212, 21, 0);

  @observable
  Color sombraColor = Color.fromARGB(255, 0, 0, 0);  

  @observable
  Color sombraColor2 = Color.fromARGB(255, 50, 50, 50); 

  @observable
  Color buttonBackgroundColor = Color.fromARGB(255, 255, 255, 255);


  @action
  void setcadastroAppColor1(Color color) {
    cadastroAppColor1 = color;
  }

  @action
  void setcadastroBackColor2(Color color) {
    cadastroBackColor2 = color;
  }
  
  @action
  void setcadastrobuttonColor(Color color){
    cadastrobuttonColor = color;
  }

  @action
  void setsombraColor(Color color){
    sombraColor = color;
  }

  @action
  void setcombraColor2(Color color){
    sombraColor2 = color;
  }

  @action
  void setTextColor(Color color) {
    textColor = color;
  }

  @action
  void setTextColor2(Color color) {
    textColor2 = color;
  }

  @action
  void setAcceptColor(Color color) {
    acceptColor = color;
  }

  @action
  void setEditIconColor(Color color) {
    editIconColor = color;
  }

  @action
  void setDeclineColor(Color color) {
    declineColor = color;
  }

  @action
  void setDeleteIconColor(Color color) {
    deleteIconColor = color;
  }

  @action
  void setBackSnackSucessColor(Color color) {
    backSnackSucessColor = color;
  }

  @action
  void setBackSnackFailColor(Color color) {
    backSnackfailColor = color;
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
  void setappbarArqColor(Color color){
    appbarArqColor = color;
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