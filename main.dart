import 'dart:io';
import 'dart:math';

void main() {
  var vitorias = 0;
  var derotas = 0;
  var totalRodadas = 0;
  var empate = 0;
  var dadoMagico = 0;

int rolarDados() {
  //Rolagem de um Dado
  return Random().nextInt(6) + 1;
}

String ganhou(var vitorias, var derotas) {
  // Determinação do Vencedor
  if (vitorias > derotas) {
    print("Voce ganhou o jogo");
    print("Placar:");
    print("Numero de vitorias: $vitorias");
    print("Numero de derrotas: $derotas");
    print("Numero de empates: $empate");
    return '0';
  } else if (derotas > vitorias) {
    print("Voce perdeu o jogo");
    print("Numero de vitorias: $vitorias");
    print("Numero de derrotas: $derotas");
    print("Numero de empates: $empate");
    return '0';
  } else {
    print("Voce empatou o jogo");
    print("Numero de vitorias: $vitorias");
    print("Numero de derrotas: $derotas");
    print("Numero de empates: $empate");
    return '0';
  }
}

  while(true){
    print('Quantas rodadas serao jogadas?');
    print('Caso deseje sair, input o valor 0');
    totalRodadas = int.parse(stdin.readLineSync()!);
    //print(totalRodadas);
    if (totalRodadas == 0) {
      //print('fechou com sucesso');
      break;
    }
    for (var rodada = 1; rodada <= totalRodadas; rodada++) {
      var jogadaJogador = 0;
      if(dadoMagico == 0){
        print("Deseja ultilizar o dado magico?");
        print("Digite 1 para confirmar, ou 0 para cancelar");
        dadoMagico = int.parse(stdin.readLineSync()!);
      }
      var jogada1 = rolarDados();
      var jogada2 = rolarDados();
      var jogada3 = rolarDados();
      print("Voce rodou:");
      print(jogada1);
      print(jogada2);
      print(jogada3);
      if(dadoMagico == 1){
        if(Random().nextInt(1) == 0){
          jogadaJogador = (jogada1 + jogada2 + jogada3)~/2;
          dadoMagico = 2;
        } else{
          jogadaJogador = (jogada1 + jogada2 + jogada3)*2;
          dadoMagico = 2;
        }
      }else{
        jogadaJogador = jogada1 + jogada2 + jogada3;
      }
      print("Total da soma dos seus 3 dados: $jogadaJogador");
      var jogadaComp = 0;
      jogada1 = rolarDados();
      jogada2 = rolarDados();
      jogada3 = rolarDados();
      print("A maquina rodou:");
      print(jogada1);
      print(jogada2);
      print(jogada3);
      jogadaComp = jogada1 + jogada2 + jogada3;
      print("Total da soma dos 3 dados da maquina: $jogadaComp");
      print("Final da rodada");
      if(jogadaJogador > jogadaComp){
        print("Voce foi vitorioso nessa rodada");
        vitorias++;
        //print(vitorias);
      } else if(jogadaJogador < jogadaComp){
        print("Voce foi derrotado nessa rodada");
        derotas++;
        //print(derotas);
      } else {
        print("Ocorreu um empate nessa rodada");
        empate++;
      }
    }
    ganhou(vitorias,derotas);
    vitorias = 0;
    derotas = 0;
    empate = 0;
    dadoMagico = 0;
  }
}