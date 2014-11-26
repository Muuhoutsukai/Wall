<?php

function login($email, $password){

	global $db;
	
	$sql = "SELECT * from gebruiker WHERE email = :email and password = :password";

	$stmt = $db->prepare($sql);

	$stmt->bindParam(':email', $email, PDO::PARAM_STR);
	$stmt->bindParam(':password', $password, PDO::PARAM_STR);

	$stmt->execute();

	$_SESSION['email']    = $email;
	$_SESSION['password'] = $password;

	return $stmt->fetch(PDO::FETCH_ASSOC);
	$_SESSION['gebruiker_id'] = $gebruiker;
	$gebruiker = $_SESSION['gebruiker_id'];

	}

function registerPersoon($voornaam, $achternaam, $geslacht, $geboortedatum, $adres, $postcode, $woonplaats, $telefoon, $mobiel){

	global $db;
	$sql = "INSERT INTO persoon (voornaam, achternaam, geslacht, geboortedatum, adres, postcode, woonplaats, telefoon, mobiel)
			VALUES   (:voornaam, :achternaam, :geslacht, :geboortedatum, :adres, :postcode, :woonplaats, :telefoon, :mobiel)";
	
	$stmt = $db->prepare($sql);		
	$stmt->bindParam(':voornaam',  	 	$voornaam,	 	PDO::PARAM_STR);
	$stmt->bindParam(':achternaam', 	$achternaam, 	PDO::PARAM_STR);
	$stmt->bindParam(':geslacht', 		$geslacht, 		PDO::PARAM_STR);
	$stmt->bindParam(':geboortedatum',	$geboortedatum,	PDO::PARAM_STR);
	$stmt->bindParam(':adres', 			$adres, 		PDO::PARAM_STR);
	$stmt->bindParam(':postcode', 		$postcode, 		PDO::PARAM_STR);
	$stmt->bindParam(':woonplaats', 	$woonplaats, 	PDO::PARAM_STR);
	$stmt->bindParam(':telefoon', 		$telefoon, 		PDO::PARAM_STR);
	$stmt->bindParam(':mobiel', 		$mobiel, 		PDO::PARAM_STR);

	$stmt->execute();
	return $db->lastInsertId();
	}

	function registerUser($email, $password, $persoon_id){

	global $db;

	$sql = "INSERT INTO gebruiker (email, password, persoon_id)
			VALUES              (:email, :password, :persoon_id)";

	$stmt = $db->prepare($sql);

	$stmt->bindParam(':email', 		$email,		PDO::PARAM_STR);
	$stmt->bindParam(':password',	$password,	PDO::PARAM_STR); 
	$stmt->bindParam(':persoon_id',	$persoon_id, PDO::PARAM_INT);

	$stmt->execute();
}

function getDatabase(){
	global $db;
	$db = new PDO('mysql:host=localhost;dbname=wall', 'root', '');
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
}

function getPost($id){
  	global $db;
 
  	$sql = "SELECT *
    		FROM post
    		WHERE id = :id";
  	$stmt = $db->prepare($sql);
  	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
  	$stmt->fetch(PDO::FETCH_ASSOC);
 	$stmt->execute();
  	return $stmt->fetch(PDO::FETCH_ASSOC); 
 }

function getProfile($persoonid){
  	global $db;
 
  	$sql = "SELECT persoon.*, post.*, post.id AS postId, persoon.id as persoonId
			FROM post
			INNER JOIN gebruiker 
			ON post.gebruiker_id = gebruiker.id
			INNER JOIN persoon 
			ON gebruiker.persoon_id = persoon.id 
			WHERE persoon.id = $persoonid
			ORDER BY post.id DESC";

  	$stmt = $db->prepare($sql);
  	$stmt->bindParam(':persoonid', $persoonid, PDO::PARAM_INT);
 	$stmt->execute();
  	return $stmt->fetch(PDO::FETCH_ASSOC);
 }

 function editProfile($voornaam, $achternaam, $geslacht, $geboortedatum, $adres, $postcode, $woonplaats, $telefoon, $mobiel, $id){
			global $db;
			$sql = "UPDATE persoon
					SET voornaam = :voornaam, achternaam = :achternaam, geslacht = :geslacht, geboortedatum = :geboortedatum, adres = :adres,
					postcode = :postcode, woonplaats = :woonplaats, telefoon = :telefoon, mobiel = :mobiel 
					WHERE id = :id";
	
			$stmt = $db->prepare($sql);

			$stmt->bindParam(':voornaam', 			$voornaam, PDO::PARAM_STR);
			$stmt->bindParam(':achternaam', 		$achternaam, PDO::PARAM_STR);
			$stmt->bindParam(':geslacht', 			$geslacht, PDO::PARAM_STR);
			$stmt->bindParam(':geboortedatum', 		$geboortedatum, PDO::PARAM_STR);
			$stmt->bindParam(':adres', 				$adres, PDO::PARAM_STR);
			$stmt->bindParam(':postcode', 			$postcode, PDO::PARAM_STR);
			$stmt->bindParam(':woonplaats', 		$woonplaats, PDO::PARAM_STR);
			$stmt->bindParam(':telefoon', 			$telefoon, PDO::PARAM_STR);
			$stmt->bindParam(':mobiel', 			$mobiel, PDO::PARAM_STR);
			$stmt->bindParam(':id', 				$id, PDO::PARAM_INT);

			$stmt->execute();
}

function profilePost($persoonid){
	global $db;
	$sql = "SELECT persoon.*, post.*, post.id AS postId, persoon.id as persoonId
			FROM post
			INNER JOIN gebruiker 
			ON post.gebruiker_id = gebruiker.id
			INNER JOIN persoon 
			ON gebruiker.persoon_id = persoon.id 
			WHERE persoon.id = $persoonid
			ORDER BY post.id DESC";

	$stmt = $db->prepare($sql);
  	$stmt->bindParam(':persoonid', $persoonid, PDO::PARAM_INT);
 	$stmt->execute();

	return $db->query($sql);
}

function insertPost($content, $gebruiker){
		global $db;
		$gebruiker = $_SESSION["gebruiker_id"];
		$sql = "INSERT INTO post (content, gebruiker_id, status) VALUES (:content, :gebruiker, 1)";

		$stmt = $db->prepare($sql);
		$stmt->bindParam(':content', 	$content, PDO::PARAM_STR);
		$stmt->bindParam(':gebruiker', 	$gebruiker, PDO::PARAM_INT);
		$stmt->execute();
}

function insertComment($content, $gebruiker, $postid){
  global $db;
  $gebruiker = $_SESSION["gebruiker_id"];
  $sql = "INSERT INTO comment (content, status, post_id, gebruiker_id) VALUES (:content, 1, :postId, :gebruiker)"; 
  $stmt = $db->prepare($sql);
  $stmt->bindParam(':content', 		$content, PDO::PARAM_STR);
  $stmt->bindParam(':postId', 		$postid, PDO::PARAM_INT);         
  $stmt->bindParam(':gebruiker', 	$gebruiker, PDO::PARAM_INT);         
  $stmt->execute();
}

function editPost(){
			global $db;
			$gebruiker = $_SESSION["gebruiker_id"];
			$sql = "UPDATE post SET content=:content WHERE id=:id";
	
			$stmt = $db->prepare($sql);

			$stmt->bindParam(':content', 	$content, PDO::PARAM_STR);
			$stmt->bindParam(':id', 		$id, PDO::PARAM_INT);

			$content = $_POST['content'];
			$id = $_POST['id'];

			$stmt->execute();
}

function getComment($id){
  	global $db;
 
  	$sql = "SELECT persoon.*, comment.*, comment.id AS commentId, persoon.id as persoonId, comment.status as commentStatus
    		FROM comment
    		INNER JOIN post
    		ON comment.post_id = post.id
    		INNER JOIN gebruiker 
			ON comment.gebruiker_id = gebruiker.id
			INNER JOIN persoon 
			ON gebruiker.persoon_id = persoon.id 
    		WHERE post.id = $id";

  	return $db->query($sql);
 }

 function getCommentById($id){
	global $db;
	$sql="select id,gebruiker_id from comment where id=:id";
	$stmt = $db->prepare($sql);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute(); 
	$result=$stmt->fetch(PDO::FETCH_ASSOC);  
	return $result;
 }

function editComment($content, $id){
			global $db;
			$sql = "UPDATE comment SET content=:content WHERE id=:id";

			$stmt = $db->prepare($sql);

			$stmt->bindParam(':content', 	$content, PDO::PARAM_STR);
			$stmt->bindParam(':id', 		$id, PDO::PARAM_INT);

			$stmt->execute();
}

 function editGetComment($id){
  	global $db;
 
  	$sql = "SELECT persoon.*, comment.*, comment.id AS commentId, persoon.id as persoonId
    		FROM comment
    		INNER JOIN gebruiker 
			ON comment.gebruiker_id = gebruiker.id
			INNER JOIN persoon 
			ON gebruiker.persoon_id = persoon.id 
    		WHERE comment.id = $id";

  	return $db->query($sql);
 }

 function deleteComment($id){
	global $db;
	$sql = "DELETE FROM comment WHERE id = :id";
	$stmt = $db->prepare($sql);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	$results = $db->query($sql);
}

function deletePost($id){
 global $db;
 $id = $_GET['id'];
 $sql = "UPDATE comment SET status = '0' WHERE id = :id";
 $stmt = $db->prepare($sql);
 $stmt->bindParam(':id', $id, PDO::PARAM_INT);
 $stmt->execute();
}

function defaultCase(){
	global $db;
	$sql = "SELECT post.status, post.content, post.id
	as postId, post.datum,post.gebruiker_id, persoon.*, gebruiker.id
	as gebruikerId, gebruiker.email, gebruiker.persoon_id
	FROM post
	INNER JOIN gebruiker on post.gebruiker_id=gebruiker.id
	INNER JOIN persoon on gebruiker.persoon_id=persoon.id
	ORDER BY post.id desc";

	return $db->query($sql);
}

?>