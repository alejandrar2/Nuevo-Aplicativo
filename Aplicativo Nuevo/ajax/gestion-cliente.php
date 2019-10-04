<?php 

	include_once('../Modelo/clase-cliente.php');
	

	switch ($_GET["accion"]) {
		case 'obtener':
			Cliente::obtenerCliente();
			break;

		case 'add':
<<<<<<< HEAD
			$cliente = new Cliente(null, 0);
			$cliente->add();
=======
			$cliente = new Cliente(null, $_POST["idPersona"]);
			echo $cliente->add();
>>>>>>> origin/master
		
		break;
		
		default:
			# code...
			break;
	}
























 ?>