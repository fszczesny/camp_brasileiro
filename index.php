<?php
  $servidor = "localhost";
  $usuario = "raphael";
  $senha ="admin";
  $porta = 5432;
  $nomeBanco = "camp_brasileiro";
  $conexao = pg_connect("host=$servidor port=$porta dbname=$nomeBanco user=$usuario password=$senha");
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
      $result = pg_query($conexao, "SELECT T.nome, count(D.nome) FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm GROUP BY T.id_time;");
    ?>
    <p>Número de jogadores no DM em cada time</p>
    <table>
        <tr>
          <th>Time</th>
          <th>Número de jogadores</th>
        </tr>
        <?php
          while ($row = pg_fetch_array($result)) {
            echo "<tr><td>".$row['nome']."</td>
                  <td>".$row['count']."</td></tr>";
          }
        ?>
    </table>
    <hr>
    <?php
      $result = pg_query($conexao, "SELECT T.nome FROM dadosjogador D INNER JOIN time T ON D.id_time = T.id_time NATURAL JOIN dm m GROUP BY T.id_time HAVING COUNT(D.nome) >= 2");
    ?>
    <p>Times com número de jogares no DM maior ou igual a 2</p>
    <table>
        <tr>
          <th>Time</th>
        </tr>
        <?php
          while ($row = pg_fetch_array($result)) {
            echo "<tr><td>".$row['nome']."</td>";
          }
        ?>
    </table>
    <hr>
    <?php
      $result = pg_query($conexao, "SELECT DJ.nome, DP.lesao, DP.data_lesao, DP.previsao_dias FROM dm DP INNER JOIN dadosjogador DJ ON DJ.id_jogador = DP.id_jogador INNER JOIN time T on T.id_time = DJ.id_time WHERE t.nome = 'Grêmio'");
    ?>
    <p>Jogadores de determinado time que estão no DM</p>
    <table>
        <tr>
          <th>Jogador</th>
          <th>Lesão</th>
          <th>Data da lesão</th>
          <th>Previsão de dias parado</th>
        </tr>
        <?php
          while ($row = pg_fetch_array($result)) {
            echo "<tr><td>".$row['nome']."</td>"
                ."<td>".$row['lesao']."</td>"
                ."<td>".$row['data_lesao']."</td>"
                ."<td>".$row['previsao_dias']."</td></tr>";
          }
        ?>
    </table>
    <hr>
    <?php
      $result = pg_query($conexao, "SELECT * from partida WHERE NOT EXISTS (SELECT * FROM partida NATURAL JOIN estatisticas WHERE cartoes_vermelhos_mand <> 0 OR cartoes_vermelhos_visit <> 0)");
    ?>
    <p>Dados das partidas que tiveram jogadores expulsos</p>
    <table>
        <tr>
          <th>Jogador</th>
          <th>Lesão</th>
          <th>Data da lesão</th>
          <th>Previsão de dias parado</th>
        </tr>
        <?php
          while ($row = pg_fetch_array($result)) {
            echo "<tr><td>".$row['id_partida']."</td>"
                ."<td>".$row['data_partida']."</td>"
                ."<td>".$row['hora']."</td>"
                ."<td>".$row['gols_mandante']."</td>"
                ."<td>".$row['gols_visitante']."</td>"
                ."<td>".$row['time_mandante']."</td>"
                ."<td>".$row['time_visitante']."</td>"
                ."<td>".$row['id_estadio']."</td>"
                ."<td>".$row['id_arbitros']."</td>"
                ."<td>".$row['id_assistente_1']."</td>"
                ."<td>".$row['id_assistente_2']."</td>"
                ."<td>".$row['id_quarto_arbitro']."</td></tr>";
          }
        ?>
    </table>
  </body>
</html>
