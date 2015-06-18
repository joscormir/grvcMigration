<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<?
require("confpro.php");

$aux = $_GET['pro']; 

if($aux!="Todos por fecha" && $aux!="Todos por tipo" && $aux!="Sólo en desarrollo" && $aux!="Sólo terminados")
{
    if($aux=="Robótica")	       $tabla="trobotica";
	elseif($aux=="Sistemas de Percepción")     $tabla="tpercepcion";
	elseif($aux=="Internacionales")     $tabla="tinternacional";
	elseif($aux=="Nacionales")     $tabla="tnacional";
	else                           $tabla="tcontrol";
}
else 
   $tabla="todos";

setlocale(LC_ALL, "ca_ES");
?>

<html>
<head>
  <meta http-equiv="Content-Language" content="es">
  <META NAME="Description" CONTENT="GRVC - Proyectos">
  <META NAME="keywords" CONTENT="hetero,aerial vehicles,robot coordination,unmanned aerial vehicles, forest fire fighting">
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

  <title>Lectura de Proyectos</title>

  <link rel="stylesheet" href="/utiles/css/standard.css" type="text/css" />
</head>

<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0>
<? include("cabecera.php") ?>
</body>

<table border="0" cellpadding="2" cellspacing="5"  width="650" class="justify">
<tr>
<? 
   if($tabla!="todos")
   {  
   	  echo "<td colspan=2><table class='catTitulo'width=100% border='1' cellspacing='2' cellpadding='2'><tr>";
      echo "<td width=50% align=center bgcolor=#000066><a href='leer.php?pro=Internacionales' target='frmMain'><b>Proyectos<br>Internacionales</b></a></td>";
      echo "<td width=50% align=center bgcolor=#660000><a href='leer.php?pro=Nacionales' target='frmMain'><b>Proyectos<br>Nacionales</b></a></td></tr></table>";   
      echo "<tr><td colspan=2 ><p class=title>Proyectos ".$aux."</p></td></tr>";
	  echo "<tr><td colspan=2 align=center><br><br><hr><font size=2>[ <a href='gestionar.php?tab=".$tabla."' target='frmMain'>Gestionar</a> ]&nbsp;&nbsp;&nbsp;&nbsp;[ <a href='../project.php' target='frmMain'>Volver</a> ]</font><hr></td></tr>";
	  leerTabla($tabla,0);	  
   }
   else		
   {  
      if($aux=="Todos por fecha" || $aux=="Todos por tipo")   	  
	  {
	     echo "<td colspan=2><p class=title>Todos los Proyectos</p></td></tr>";
	     echo "<tr><td colspan=2 align=center><br><br><hr><font size=2>[ <a href='../project.php' name='#pvolver' target='frmMain'>Volver</a> ]</font><hr><br><br></td></tr>";
		 if($aux=="Todos por fecha")     leerTodos("fecha");
	     else  leerTodos("tipo");		 
	  }
	  elseif($aux=="Sólo en desarrollo")
	  {   
	     echo "<td colspan=2><p class=title>Proyectos en Desarrollo</p></td></tr>";
		 echo "<tr><td colspan=2 align=center><br><br><hr><font size=2>[ <a href='../project.php' name='#pvolver' target='frmMain'>Volver</a> ]</font><hr><br><br></td></tr>"; 
		 leertodos("desarrollo");
	  }
	  else
	  {   
	    echo "<td colspan=2><p class=title>Proyectos Terminados</p></td></tr>";
	    echo "<tr><td colspan=2 align=center><br><br><hr><font size=2>[ <a href='../project.php' name='#pvolver' target='frmMain'>Volver</a> ]</font><hr><br><br></td></tr>";  
		leertodos("terminados");
	  } 
   }
?>
</table>
<br>
</body>
</html>
