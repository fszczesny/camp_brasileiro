<?php
  $servidor = "localhost";
  $usuario = "raphael";
  $senha ="admin";
  $porta = 5432;
  $nomeBanco = "camp_brasileiro";
  $conexao = pg_connect("host=$servidor port=$porta dbname=$nomeBanco user=$usuario password=$senha");

  $consultas = [];
  
  // Retorna nome do time e número de jogadores no DM
  array_push($consultas, "SELECT T.nome, count(D.nome) FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm GROUP BY T.id_time");

  // Retorna nome do time com mais de N = 2 jogadores no DM
  array_push($consultas, "SELECT T.nome FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm m GROUP BY T.id_time HAVING COUNT(D.nome) >= 2");

  // Retorna os jogadores de determinado time no DM
  array_push($consultas, "SELECT DJ.nome, DP.lesao, DP.data_lesao, DP.previsao_dias FROM dm DP INNER JOIN dadosjogador DJ ON DJ.id_jogador = DP.id_jogador INNER JOIN time T on T.id_time = DJ.id_time WHERE t.nome = 'Grêmio'");

  // Retorna os dados das partidas que tiveram jogadores expulsos
  array_push($consultas, "SELECT * FROM partida NATURAL JOIN estatisticas WHERE cartoes_vermelhos_mand <> 0 OR cartoes_vermelhos_visit <> 0");

  // Retorna publico das partidas data, nome dos times e ordena por publico crescente
  array_push($consultas, "SELECT ES.apelido, E.publico, T1.nome as Mandante, T2.nome as Visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN estadio ES ON ES.id_estadio = P.id_estadio INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante ORDER BY E.publico DESC");

  // Exibe historico de partidas
  array_push($consultas, "SELECT T1.nome AS Mandante, p.gols_mandante, T2.nome AS Visitante, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante ORDER BY P.data_partida asc");

  // Exibe historico de partidas de determinado time
  array_push($consultas, "SELECT T1.nome AS Mandante, p.gols_mandante, T2.nome AS Visitante, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante WHERE T1.nome = 'Inter' OR T2.nome = 'Inter' ORDER BY P.data_partida asc");

  // Retorna times que ganharam fora e numero de vitorias
  array_push($consultas, "SELECT T.nome, count(T.nome) FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T on T.id_time = P.time_visitante WHERE p.gols_mandante < p.gols_visitante GROUP by T.id_time");

  // Lista a comissão tecnica de todos os time
  array_push($consultas, "SELECT T.nome AS Time, DT.nome AS Treinador, AT.nome AS Auxiliar FROM time T INNER join dadostecnico DT on DT.id_time = T.id_time INNER join dadosauxiliartecnico AT on AT.id_time = T.id_time");

  // Gera estatisticas dos arbitros (numero de partidas apitadas, numero de cartões vermelhos dados, numero de cartões amarelos dados)
  array_push($consultas, "SELECT DT.nome AS Arbitro, count(PART.id_partida) AS Partidas, (SUM(EST.cartoes_vermelhos_mand) + SUM(EST.cartoes_vermelhos_visit)) AS Cartoes_Vermelhos, (SUM(EST.cartoes_amarelos_visit) + SUM(EST.cartoes_amarelos_mand)) AS cartoes_amarelos from estatisticas EST INNER join partida PART on PART.id_partida = EST.id_partida INNER join dadosarbrito DT on DT.cod_comprovante_curso = PART.id_arbitro GROUP by DT.nome ORDER by count(PART.id_partida), (SUM(EST.cartoes_vermelhos_mand) + SUM(EST.cartoes_vermelhos_visit)), (SUM(EST.cartoes_amarelos_visit) + SUM(EST.cartoes_amarelos_mand))");

  $informacaoConsultas = [];
  array_push($informacaoConsultas, "Nome do time e número de jogadores no DM");
  array_push($informacaoConsultas, "Nome do time com mais de 2 jogadores no DM");
  array_push($informacaoConsultas, "Jogadores de determinado time no DM");
  array_push($informacaoConsultas, "Retorna os dados das partidas que tiveram jogadores expulsos");
  array_push($informacaoConsultas, "Retorna publico das partidas data, nome dos times e ordena por publico crescente");
  array_push($informacaoConsultas, "Exibe historico de partidas");
  array_push($informacaoConsultas, "Exibe historico de partidas de determinado time");
  array_push($informacaoConsultas, "Retorna times que ganharam fora e numero de vitorias");
  array_push($informacaoConsultas, "Lista a comissão tecnica de todos os time");
  array_push($informacaoConsultas, "Gera estatisticas dos arbitros (numero de partidas apitadas, numero de cartões vermelhos dados, numero de cartões amarelos dados)");
?>
<html>
  <head>
    <style>
      table, th, td {
        border: 1px solid black;
        text-align: right;
      }
    </style>
  </head>
  <body>
    <?php
      foreach ($consultas as $key => $consulta) {
        $primeira_linha = true;
        $result = pg_query($conexao, $consulta);
        echo "<p>".$informacaoConsultas[$key]."</p>";
        echo "<table>";
        while ($row = pg_fetch_array($result)) {
          if ($primeira_linha) {
            echo "<tr>";
            foreach ($row as $column => $value) {
              if (!is_numeric($column)) {
                echo "<th>".$column."</th>";
              }
            }
            echo "</tr>";
            $primeira_linha = false;
          }
          echo "<tr>";
          foreach ($row as $column => $value) {
            if (is_numeric($column)) {
              echo "<td>".$value."</td>";
            }
          }
          echo "</tr>";
        }
        echo "</table><br><hr>";
      }
    ?>
    
  </body>
</html>
