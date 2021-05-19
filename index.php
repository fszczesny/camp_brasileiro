<?php
  $servidor = "localhost";
  $usuario = "raphael";
  $senha ="admin";
  $porta = 5432;
  $nomeBanco = "camp_brasileiro";
  $conexao = pg_connect("host=$servidor port=$porta dbname=$nomeBanco user=$usuario password=$senha");

  $consultas = [];
  $consultasDinamicas = [];
  
  //Consultas dinamicas
  if (isset($_GET['consulta_0'])){
    $condicaoConsulta_0 = $_GET['consulta_0'];
  } else {
    $condicaoConsulta_0 = 'NULL';
  }
  if (isset($_GET['consulta_1'])){
    $condicaoConsulta_1 = $_GET['consulta_1'];
  } else {
    $condicaoConsulta_1 = 'NULL';
  }
  if (isset($_GET['consulta_2'])){
    $condicaoConsulta_2 = $_GET['consulta_2'];
  } else {
    $condicaoConsulta_2 = 'NULL';
  }
  // Retorna os jogadores de determinado time no DM
  array_push($consultasDinamicas, "SELECT DJ.nome, DP.lesao, DP.data_lesao, DP.previsao_dias FROM dm DP INNER JOIN dadosjogador DJ ON DJ.id_jogador = DP.id_jogador INNER JOIN time T on T.id_time = DJ.id_time WHERE t.nome LIKE '%$condicaoConsulta_0%'");
  
  // Exibe historico de partidas de determinado time
  array_push($consultasDinamicas, "SELECT T1.nome AS Mandante, p.gols_mandante, T2.nome AS Visitante, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante WHERE T1.nome LIKE '%$condicaoConsulta_1%' OR T2.nome LIKE '%$condicaoConsulta_1%' ORDER BY P.data_partida asc");

  // Lista a comissão tecnica de determinado time os time
  array_push($consultasDinamicas, "SELECT T.nome AS Time, DT.nome AS Treinador, AT.nome AS Auxiliar FROM time T INNER join dadostecnico DT on DT.id_time = T.id_time INNER join dadosauxiliartecnico AT on AT.id_time = T.id_time WHERE T.nome LIKE '%$condicaoConsulta_2%'");

  $informacaoConsultasDinamicas = [];
  array_push($informacaoConsultasDinamicas, "Pesquise jogares que estão no DM pelo seu time:");
  array_push($informacaoConsultasDinamicas, "Pesquise historico de partidas de determinado time");
  array_push($informacaoConsultasDinamicas, "Pesquise a comissão tecnica de determinado time");

  //Consultas estaticas
  // Retorna nome do time e número de jogadores no DM
  array_push($consultas, "SELECT T.nome, count(D.nome) FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm GROUP BY T.id_time");

  // Retorna nome do time com mais de N = 2 jogadores no DM
  array_push($consultas, "SELECT T.nome FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm m GROUP BY T.id_time HAVING COUNT(D.nome) >= 2");

  // Os times que jogaram em todos os estádios que o Grêmio jogou 
  array_push($consultas, "SELECT T.nome FROM time T WHERE T.id_time <> 1 AND NOT EXISTS(SELECT * FROM partida P WHERE (P.time_mandante = 1 OR P.time_visitante = 1) AND P.id_estadio NOT IN (SELECT DISTINCT id_estadio FROM partida WHERE time_mandante = T.id_time OR time_visitante = T.id_time))");

  // Retorna publico das partidas data, nome dos times e ordena por publico crescente
  array_push($consultas, "SELECT ES.apelido, E.publico, T1.nome as Mandante, T2.nome as Visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN estadio ES ON ES.id_estadio = P.id_estadio INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante ORDER BY E.publico DESC");

  // Exibe historico de partidas
  array_push($consultas, "SELECT T1.nome AS Mandante, p.gols_mandante, T2.nome AS Visitante, p.gols_visitante, P.data_partida FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T1 on T1.id_time = P.time_mandante INNER JOIN time T2 ON T2.id_time = p.time_visitante ORDER BY P.data_partida asc");

  // Retorna times que ganharam fora e numero de vitorias
  array_push($consultas, "SELECT T.nome, count(T.nome) FROM estatisticas E INNER JOIN partida P ON P.id_partida = E.id_partida INNER JOIN time T on T.id_time = P.time_visitante WHERE p.gols_mandante < p.gols_visitante GROUP by T.id_time");

  // Gera estatisticas dos arbitros (numero de partidas apitadas, numero de cartões vermelhos dados, numero de cartões amarelos dados)
  array_push($consultas, "SELECT DT.nome AS Arbitro, count(PART.id_partida) AS Partidas, (SUM(EST.cartoes_vermelhos_mand) + SUM(EST.cartoes_vermelhos_visit)) AS Cartoes_Vermelhos, (SUM(EST.cartoes_amarelos_visit) + SUM(EST.cartoes_amarelos_mand)) AS cartoes_amarelos from estatisticas EST INNER join partida PART on PART.id_partida = EST.id_partida INNER join dadosarbrito DT on DT.cod_comprovante_curso = PART.id_arbitro GROUP by DT.nome ORDER by count(PART.id_partida), (SUM(EST.cartoes_vermelhos_mand) + SUM(EST.cartoes_vermelhos_visit)), (SUM(EST.cartoes_amarelos_visit) + SUM(EST.cartoes_amarelos_mand))");

  $informacaoConsultas = [];
  array_push($informacaoConsultas, "Nome do time e número de jogadores no DM");
  array_push($informacaoConsultas, "Nome do time com mais de 2 jogadores no DM");
  array_push($informacaoConsultas, "Times que jogaram em todos os estádios que o Grêmio jogou");
  array_push($informacaoConsultas, "Retorna publico das partidas data, nome dos times e ordena por publico crescente");
  array_push($informacaoConsultas, "Exibe historico de partidas");
  array_push($informacaoConsultas, "Retorna times que ganharam fora e numero de vitorias");
  array_push($informacaoConsultas, "Lista a comissão tecnica de todos os time");
  array_push($informacaoConsultas, "Gera estatisticas dos arbitros (numero de partidas apitadas, numero de cartões vermelhos dados, numero de cartões amarelos dados)");
?>
<html>
  <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
      .page {
        display: flex;
        align-items: stretch;
        flex-direction: column;
        margin: 10px;
      }
      .table {
        table-layout: auto;
        width: 90%;
        align-self: center;
      }
    </style>
  </head>
  <body>
    <div class="page">
    <?php
      foreach ($consultasDinamicas as $key => $consulta) {
        $primeira_linha = true;
        $result = pg_query($conexao, $consulta);
        ?>
        <form action="index.php" method="GET">
          <?php echo $informacaoConsultasDinamicas[$key]; ?>
          <input type="text" <?php echo "name='consulta_$key'"; ?> placeholder="time"/>
          <input type="submit" value="Pesquisar">
        </form>
        <?php
        echo "<table class='table table-dark'>";
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

    <?php
      foreach ($consultas as $key => $consulta) {
        $primeira_linha = true;
        $result = pg_query($conexao, $consulta);
        echo "<p>".$informacaoConsultas[$key]."</p>";
        echo "<table class='table table-dark'>";
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
    </div>
  </body>
</html>
