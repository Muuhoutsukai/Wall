<?php

$db = new PDO('mysql:host=localhost;dbname=wall', 'root', '');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

include( "./class.TemplatePower.inc.php" );
include("model.php");

	$tpl = new TemplatePower("./template.tpl");
	$tpl->prepare();
	$tpl->printToScreen();

if(isset($_GET['actie'])){
	$actie = $_GET['actie'];
} else {
	$actie = null;
}

switch ($actie) {
	case 'registreren':
		
		if(isset($_POST['submit'])){

			$persoon_id = registerPersoon($_POST['voornaam'], $_POST['achternaam'], $_POST['geslacht'], $_POST['geboortedatum'], $_POST['adres'],
			$_POST['postcode'], $_POST['woonplaats'], $_POST['telefoon'], $_POST['mobiel']);

			registerUser($_POST['email'], $_POST['password'], $persoon_id);

			header('location:login.php');

			} else {

		   		$tpl->newBlock("registreren");		
			}
		
break;

	case 'login':

	$tpl->newBlock("login");
	if(isset($_POST['submit']))
	{
		$row = login($_POST['email'], $_POST['password']);
		if ($row)
	{
		session_start();
		$id = $row['persoon_id'];
		$_SESSION['persoon_id'] = 	$row['persoon_id'];
		$_SESSION['gebruiker_id'] = $row['id'];
		$row = getProfile($_SESSION['persoon_id']);
		if($row){
			$tpl->assign("LOGIN", '');
		}
		
		header("location:profile.php?id=$id");
	}
	else
	{
		header("location:login.php?actie=login");
		$tpl->assign("LOGIN", "<a href='login.php?actie=login'>Inloggen</a>");
	}
}

break;

	default:

    $tpl->newBlock("default");
    
break;
	}

$tpl->gotoBlock("_ROOT");
$tpl->printToScreen();
$db = null;		
?>