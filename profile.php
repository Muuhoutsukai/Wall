<?php 

session_start();

if(!isset($_SESSION['persoon_id']))
{
  header("location:login.php?actie=login");
}

require "model.php";

$db = new PDO('mysql:host=localhost;dbname=wall', 'root', '');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

include( "./class.TemplatePower.inc.php" );

$tpl = new TemplatePower("./template.tpl");

$tpl->prepare();

if(isset($_GET['actie'])){
  $actie = $_GET['actie'];
} else {
  $actie = null;
}

switch ($actie) {

default:

$tpl->newBlock("profile");

$row = getProfile($_GET['id']);
if($row){
	$tpl->assign("VOORNAAM", 	 $row['voornaam']);
	$tpl->assign("ACHTERNAAM", 	 $row['achternaam']);
	$tpl->assign("GESLACHT", 	 $row['geslacht']);
	$tpl->assign("DOB", 		 $row['geboortedatum']);
	$tpl->assign("ADRES", 		 $row['adres']);
	$tpl->assign("POSTCODE", 	 $row['postcode']);
	$tpl->assign("WOONPLAATS",   $row['woonplaats']);
	$tpl->assign("TELEFOON", 	 $row['telefoon']);
	$tpl->assign("MOBIEL", 		 $row['mobiel']);
	$tpl->assign("ID", 			 $row['persoonId']);
}

$result = profilePost($_GET['id']);

foreach ($result as $row2) {
      $tpl->newBlock("profilePost");
      if($row2['status'] == 1){
          $tpl->assign("OWNCONTENT",  $row2['content']);
          $tpl->assign("VOORNAAM",    $row2['voornaam']);
          $tpl->assign("ACHTERNAAM",  $row2['achternaam']);
          $tpl->assign("profileID",   $row2['persoonId']);
        }
        elseif($row2['status'] == 0){
          $tpl->assign("OWNCONTENT", "Dit bericht is verwijderd.");
        }
      $tpl->assign("ID", $row2['id']);
  }

break;

case 'editProfile':

    if(isset($_POST['submit'])){

      editProfile($_POST['voornaam'], $_POST['achternaam'], $_POST['geslacht'], $_POST['geboortedatum'], $_POST['adres'], $_POST['postcode'],
      	$_POST['woonplaats'], $_POST['telefoon'], $_POST['mobiel'], $_POST['id']);
      
      header('location:index.php');
            
    } elseif (isset($_GET['id'])) {

      $row = getProfile($_GET['id']);

      if($row){
        $tpl->newBlock("editProfile");
        $tpl->assign("VOORNAAM",      $row['voornaam']);
        $tpl->assign("ACHTERNAAM",    $row['achternaam']);
        $tpl->assign("GESLACHT",      $row['geslacht']);
        $tpl->assign("DOB", 		  $row['geboortedatum']);
        $tpl->assign("ADRES",         $row['adres']);
        $tpl->assign("POSTCODE",      $row['postcode']);
        $tpl->assign("WOONPLAATS",    $row['woonplaats']);
        $tpl->assign("TELEFOON",      $row['telefoon']);
        $tpl->assign("MOBIEL",        $row['mobiel']);
        $tpl->assign("profileID",     $row['persoonId']);
      }

    } else {
      header('location:index.php');
    }

    break;
}

$tpl->gotoBlock("_ROOT");
$tpl->printToScreen();
$db = null;

?>