<HTML>
<body>
<h1>NÉV: CSIKÓS ATTILA, NEPTUN: LBD3WL</h1>
<table border=1>
<tr><th>Színész</th><th>Filmek Száma</th></tr>

<?php 
if(!isset($_GET["N"])){
		die("nincs N");
}
$link = mysqli_connect("localhost", "root", "", "zhfilmek") 
            or die("Kapcsolódási hiba: " . mysqli_error());

$escaped_N = mysqli_real_escape_string($link, $_GET["N"]);

/*$query ="SELECT szerepel.szinesz_nev AS szinesz_nev FROM szerepel "
."INNER JOIN szinesz ON (szerepel.szinesz_id = szinesz.id) "
."INNER JOIN filmek ON (szerepel.film_id = film.id) "
."COUNT(film.id) AS film_szam " ; probalkozas*/ 


$query = "SELECT szerepel.film_id AS film, COUNT(*) AS film_szam FROM szerepel "
."INNER JOIN szinesz ON (szerepel.szinesz_id = szinesz.id) "
."INNER JOIN filmek ON (szerepel.film_id = film.id) "
."WHERE film_szam = '{$escaped_N}' "
."GROUP BY szinesz.id, szinesz.szinesz_nev "
."ORDER BY szinesz.szinesz_nev";/*probalkozas*/

$result = mysqli_query($link, $query) or die(mysqli_error($link));

for($i =0; $row = mysqli_fetch_assoc($result); $i++) {
	$background = ($i % 2 == 0) ? '' : "style='background-color:grey' ";
    echo "<tr $background><td>".$row["szinesz_nev"]."</td><td>".$row["film_szam"]."</td></tr>";
}
mysqli_free_result($result);
mysqli_close($link);
?>

</table>
</body>
</HTML>