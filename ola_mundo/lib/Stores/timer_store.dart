import 'dart:async'; 
import 'package:mobx/mobx.dart';
part 'timer_store.g.dart';


class TimerStore = _TimerStore with _$TimerStore;

    abstract class _TimerStore with Store{
      Timer?  _timer;

      @observable
      int segundos = 0;

      @observable
      bool girando = false;

      @observable
      int vezesIniciado = 0;

      @observable
      int vezesPausado = 0;


      @computed
      String get tempoFormatado{
        final minutos = segundos ~/ 60;	
        final segundosrestant = segundos % 60;
        return '${minutos.toString().padLeft(2, '0')}:${segundosrestant.toString().padLeft(2, '0')}';
      }

      @action
      void iniciar(){

        girando = true;
        
        vezesIniciado++;

        _timer = Timer.periodic(Duration(seconds:1), (_){

          segundos++;
          
        }
        );
      }

      @action
      void pausar(){

        girando = false;

        vezesPausado++;

        _timer?.cancel();
      }
    }