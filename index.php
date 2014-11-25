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
  case 'toevoegen':
    
    if(isset($_POST['submit'])){

      insertPost($_POST['content'], $_SESSION['gebruiker_id']);

      $tpl->assign("ID", $row['id']);

      header("location:index.php");
    } else {

      $tpl->prepare();
      $tpl->newBlock("toevoegen");
    }

    break;

  case 'wijzigen':

    if(isset($_POST['submit'])){

      editPost();

      header('location:index.php');

    } elseif (isset($_GET['id'])) {

      $row = getPost($_GET['id']);

      if($row){
        $tpl->newBlock("wijzigen");
        $tpl->assign("CONTENT", $row['content']);
        $tpl->assign("ID",      $row['id']);
      }

    } else {
      header('location:index.php');
    }

    break;

  case 'verwijderen':
    if(isset($_POST['ja'])){

      $id = $_POST['id'];
      $sql = "UPDATE post 
              SET status = 0
              WHERE id = $id";

    $stmt = $db->query($sql);

    $stmt->execute();

    echo "Dit bericht is verwijderd.";
    header('location:index.php');
    }

    elseif(isset($_POST['nee'])) {
      header('location:index.php');
    } elseif (isset($_GET['id'])) {

      $row = getPost($_GET['id']);

      if($row){
        $tpl->newBlock("verwijderen");
        $tpl->assign("CONTENT", $row['content']);
        $tpl->assign("ID",      $row['id']);
      }
    }
    else
    {
      header('location: index.php');
    }
  
    break;

    case 'addComment':
    
    if(isset($_POST['submit'])){

      insertComment($_POST['content'], $_SESSION['gebruiker_id'], $_GET['postId']);
      header("location:index.php");
    }
    else {
      $tpl->prepare();
      $tpl->newBlock("addComment");
      $tpl->assign("postId", $_GET['postId']);
    }

    break;

    case 'editComment':

    if(isset($_POST['submit'])){

       editComment($_POST['content'], $_GET['id']);

      header('location:index.php');

    } elseif (isset($_GET['id'])) {

      $result = editGetComment($_GET['id']);

      foreach ($result as $row) {
      if($row){
        $tpl->newBlock("editComment");
        $tpl->assign("COMMENT",   $row['content']);
        $tpl->assign("COMMENTID", $row['commentId']);
      }

     else {
      header('location:index.php');
    }
  }
}

    break;

  case 'deleteComment':
    if(isset($_POST['ja'])){

    $id = $_GET['id'];
    $sql = "UPDATE comment 
            SET status = 0
            WHERE id = $id";

    $stmt = $db->query($sql);

    $stmt->execute();

    echo "Dit bericht is verwijderd.";
    header('location:index.php');
    }

    elseif(isset($_POST['nee'])) {
      header('location:index.php');
    } elseif (isset($_GET['id'])) {

      $result = getComment($_GET['id']);

      foreach ($result as $row) {
        if($row){
        $tpl->newBlock("deleteComment");
        $tpl->assign("CONTENT",        $row['content']);
        $tpl->assign("COMMENTID",      $row['id']);
      }
      }
    }
    else
    {
      header('location: index.php');
    }
  
    break;

  default:

  $tpl->newBlock("default");

  $tpl->assign("profileID", $_SESSION['persoon_id']);
  
  $result = defaultCase();

  foreach ($result as $row) {
      $tpl->newBlock("post");
      if($row['status'] == 1){
          $tpl->assign("CONTENT",     $row['content']);
          $tpl->assign("VOORNAAM",    $row['voornaam']);
          $tpl->assign("ACHTERNAAM",  $row['achternaam']);
          $tpl->assign("profileID",   $row['persoon_id']);
          $tpl->assign("postId",          $row['postId']);
        }
        elseif($row['status'] == 0){
          $tpl->assign("CONTENT",     "Dit bericht is verwijderd.");
          $tpl->assign("VOORNAAM",    $row['voornaam']);
          $tpl->assign("ACHTERNAAM",  $row['achternaam']);
        }

      $tpl->assign("postId",    $row['postId']);
      $result2 = getComment($row['postId']);

      foreach ($result2 as $row2) {
        $tpl->newBlock("comments");
        if($row2['commentStatus'] == 1){
          $tpl->assign("COMMENTS",    $row2['content']);
          $tpl->assign("VOORNAAM",    $row2['voornaam']);
          $tpl->assign("ACHTERNAAM",  $row2['achternaam']);
          $tpl->assign("COMMENTID",   $row2['commentId']);
          $tpl->assign("profileID",   $row2['persoonId']);
          $tpl->assign("postId",          $row2['postId']);
        }
      elseif($row2['commentStatus'] == 0){
          $tpl->assign("COMMENTS",    "Dit bericht is verwijderd.");
          $tpl->assign("VOORNAAM",    $row2['voornaam']);
          $tpl->assign("ACHTERNAAM",  $row2['achternaam']);
          $tpl->assign("COMMENTID",   $row2['commentId']);
          $tpl->assign("profileID",   $row2['persoonId']);
        }
  }
}

    break;
}

$tpl->gotoBlock("_ROOT");
$tpl->printToScreen();

$db = null;
?>    