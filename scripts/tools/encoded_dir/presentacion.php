<?php
/** @file presentacion.php
 * @author Jose Maria Maqueda Tamairón
 * @brief Presentación del Grupo de Robótica, Visión y Control\n
 * Datos almacenados en la tabla 'ge_tintroduccion' o 'ege_tintroduction'
 * @note La ordenación de los párrafos se realiza por orden ascendente
 */

include 'includes/application_top.php';
include 'includes/database.php';

/** Object: gestión de la conexión BD */
$sql = new MySQLDB;
/** Connection: identificador de conexión a la BD */
$connection = null;
/** String: tabla que contiene los datos de la presentacion */
$tabla = null;
/** Array: campos que se van a mostrar de $tabla */
$campos = null;
/** Array: orden en el que se van a mostrar los registros de $tabla */
$orden = null;
/** String: consulta realizada sobre $tabla */
$query = null;
/** 
 * Pointer: recurso BD devuelto por el método lanzar_query()
 * @see MySQLDB 
*/
$select = null;
/** 
 * Array: registro BD devuelto por el método fetch_row()
 * @see MySQLDB
*/
$record = null;

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<html>
<head>
	<script type="text/javascript">window.scrollTo({x:0,y:0});</script>
	<script type="text/javascript">marcaOpcion('presentacion');</script>
</head>
<body>
<?php 

// Abrimos la conexion de base de datos
$connection = $sql->MySQLDB();

if ($_SESSION["leng"] == 'esp') {
	
	$tabla = "ge_tintroduccion";
	$campos = array(
		0=>"parrafo");
	$orden = array(
		0=>"orden");
		
} else if ($_SESSION["leng"] == 'eng') {

	$tabla = "ege_tintroduction";
	$campos = array(
		0=>"paragraph");
	$orden = array(
		0=>"txt_order");
	
} else {
	
	$tabla = "ge_tintroduccion";
	$campos = array(
		0=>"parrafo");
	$orden = array(
		0=>"orden");
} 



$query = "SELECT $campos[0] FROM $tabla ORDER BY $orden[0]";

// Ejecutamos la consulta
$select = $sql->lanzar_query($query);

if ($connection <> null){

// Imprimimos la consulta
?>

<div style="float: left; width: 1000px;">
	<div style="float: left; width: 400px; margin-left: 300px;">
		<div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
			<p class="title"><?php	if ($_SESSION["leng"] == 'esp')
										echo convertUtf('Presentación General');
									else if ($_SESSION["leng"] == 'eng')
									 	echo convertUtf('Overview');
									else
										echo convertUtf('Presentación General'); ?></p>
		</div>
	</div>

	<div style="float: left; width: 700px; margin-left: 150px;">
		<div class="justify">
			<p style="background-color: rgb(51,51,255); line-height: 2px; font-size: 0;"><?php echo "&nbsp" ?></p>
				<?php while($record = $sql->fetch_row($select)) { ?>
					<p><?php echo convertUtf($record[0]) ?></p>
				<?php } ?>
			<p style="background-color: rgb(51,51,255); line-height: 2px; font-size: 0;"><?php echo "&nbsp" ?></p>
		</div>
	</div>
</div>
<?php } ?>
</body>
</html>
<?php include 'includes/application_bottom.php'; ?>