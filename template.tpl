<!DOCTYPE html>
 <html>
  <head>
   <title>Wall</title>
   <meta charset="utf-8">

   <style>
    label{
     width: 7em;
     float: left;
         }

     a{
   	text-decoration: none;
   	color: gray;
   }

   a:hover{
   	text-decoration: none;
   	color: blue;
   }

   </style>
   </head>

<!-- START BLOCK : toevoegen -->
<html>
			<head>
				<title>Wall</title>
				<meta charset="utf-8">
				<style>

					body{
						position: absolute;
						background-size: 100% auto;
						top: 200;
						left: 520;
					}

					label{
						width: 5em;
						float: left;
					}

					h1, label, a{
						color: black;
						font-family: Calibri;
					}

					a{
						float: right;
						margin-right: 5px;
					}

				</style>
				</head>
				<body>
					<h1>Toevoegen</h1>
					<form action="index.php?actie=toevoegen" method="POST">

						<label for="content">Content:</label>
						<textarea name="content" id="content" rows="5" cols="30"></textarea><br>

						<input type="submit" name="submit">
						<a href="index.php">Terug</a>

					</form>
<!-- END BLOCK : toevoegen -->

<!-- START BLOCK : wijzigen -->
<html>
						<head>
							<title>Wall</title>
							<meta charset="utf-8">

							<style>
								body{
									position: absolute;

									background-size: 100% auto;
									top: 200;
									left: 520;
								}

								label{
									width: 5em;
									float: left;
								}

								h1, label, a{
									color: black;
									font-family: Calibri;
								}

								a{
									float: right;
									margin-right: 5px;
								}

							</style>
							</head>
							<body>
								<h1>Wijzigen</h1>
								<form action="index.php?actie=wijzigen" method="POST">

									<label for="content">Content:</label>
									<textarea name="content" id="content" rows="5" cols="30">{CONTENT}</textarea><br>

									<input type="hidden" name="id" value="{ID}">
									</br>
									<input type="submit" name="submit">
									<a href="index.php">Terug</a>

								</form>
<!-- END BLOCK : wijzigen -->

<!-- START BLOCK : verwijderen -->
<html>
						<head>
							<title>Wall</title>
							<meta charset="utf-8">

							<style>
							body{
								position: absolute;
								background-size: 100% auto;
								top: 200;
								left: 520;
							}

							label{
								width: 5em;
								float: left;
							}

							h1, label, p{
								color: black;
								font-family: Calibri;
							}

							</style>
							</head>
							<body>
								<h1>Verwijderen</h1>
								<p>Weet je zeker dat je deze wilt verwijderen?<p>
								<form action="index.php?actie=verwijderen" method="POST">

									<label for="content">Content:</label>
									<input type="text" name="content" id="content" value="{CONTENT}" disabled><br>

									<input type="hidden" name="id" value="{ID}">
									</br>
									<input type="submit" name="ja" value="Ja">
									<input type="submit" name="nee" value="Nee">

								</form>
<!-- END BLOCK :  verwijderen -->

<!-- START BLOCK : addComment -->

<html>
			<head>
				<title>Wall</title>
				<meta charset="utf-8">
				<style>

					body{
						position: absolute;
						background-size: 100% auto;
						top: 200;
						left: 520;
					}

					label{
						width: 5em;
						float: left;
					}

					h1, label, a{
						color: black;
						font-family: Calibri;
					}

					a{
						float: right;
						margin-right: 5px;
					}

				</style>
				</head>
				<body>
					<h1>Comment toevoegen</h1>
					<form action="index.php?actie=addComment&postId={postId}" method="POST">

						<label for="content">Comment:</label>
						<textarea name="content" id="content" rows="5" cols="30"></textarea><br>

						<input type="submit" name="submit">
						<a href="index.php">Terug</a>

					</form>

<!-- END BLOCK : addComment -->

<!-- START BLOCK : editComment -->
<html>
						<head>
							<title>Wall</title>
							<meta charset="utf-8">

							<style>
								body{
									position: absolute;

									background-size: 100% auto;
									top: 200;
									left: 520;
								}

								label{
									width: 5em;
									float: left;
								}

								h1, label, a{
									color: black;
									font-family: Calibri;
								}

								a{
									float: right;
									margin-right: 5px;
								}

							</style>
							</head>
							<body>
								<h1>Comment wijzigen</h1>
								<form action="index.php?actie=editComment&id={COMMENTID}" method="POST">

									<label for="content">Comment:</label>
									<textarea name="content" id="content" rows="5" cols="30">{COMMENT}</textarea><br>

									<input type="hidden" name="id" value="{ID}">
									</br>
									<input type="submit" name="submit">
									<a href="index.php">Terug</a>

								</form>
<!-- END BLOCK : editComment -->

<!-- START BLOCK : deleteComment -->
<html>
						<head>
							<title>Wall</title>
							<meta charset="utf-8">

							<style>
							body{
								position: absolute;
								background-size: 100% auto;
								top: 200;
								left: 520;
							}

							label{
								width: 5em;
								float: left;
							}

							h1, label, p{
								color: black;
								font-family: Calibri;
							}

							</style>
							</head>
							<body>
								<h1>Comment verwijderen</h1>
								<p>Weet je zeker dat je de comment wilt verwijderen?<p>
								<form action="index.php?actie=deleteComment&id={COMMENTID}" method="POST">

									<input type="hidden" name="id" value="{ID}">
									</br>
									<input type="submit" name="ja" value="Ja">
									<input type="submit" name="nee" value="Nee">

								</form>
<!-- END BLOCK :  deleteComment -->

<!-- START BLOCK : registreren -->			
	<h1>Registreren</h1>
	<form action="login.php?actie=registreren" method="POST">

		<label for="voornaam">Voornaam:</label>
		<input type="text" name="voornaam" id="voornaam"><br>

		<label for="achternaam">Achternaam:</label>
		<input type="text" name="achternaam" id="achternaam"><br>

		<label for="adres">Emailadres:</label>
		<input type="email" name="email" id="email"><br>

		<label for="password">Wachtwoord:</label>
		<input type="password" name="password" id="password"><br>
		
		<label for="geslacht">Geslacht:</label>
		<input type="text" name="geslacht" id="geslacht"><br>

		<label for="geboortedatum">Geboortedatum:</label>
		<input type="text" name="geboortedatum" id="geboortedatum"><br>

		<label for="postcode">Postcode:</label>
		<input type="text" name="postcode" id="postcode"><br>

		<label for="adres">Adres:</label>
		<input type="text" name="adres" id="adres"><br>

		<label for="woonplaats">Woonplaats:</label>
		<input type="text" name="woonplaats" id="woonplaats"><br>

		<label for="telefoon">Telefoon:</label>
		<input type="text" name="telefoon" id="telefoon"><br>

		<label for="mobiel">Mobiel:</label>
		<input type="text" name="mobiel" id="mobiel"><br>

		<input type="submit" name="submit">

	</form>
<!-- END BLOCK : registreren -->

<!-- START BLOCK : login -->			
					<h1>Inloggen</h1>
					<form action="login.php?actie=login" method="POST">

						<label for="email">Emailadres:</label>
						<input type="email" name="email" id="email"><br>

						<label for="password">Wachtwoord:</label>
						<input type="password" name="password" id="password"><br>

						<label>&nbsp;</label>
						<input type="submit" name="submit" value="inloggen">

					</form>
					<a href="login.php?actie=registreren">Registreren</a>
<!-- END BLOCK : login -->

<!-- START BLOCK : profile -->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Wall</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/demos/style.css">
   <script>
   $(function() {
    $( "a class='button'" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
   });
   </script>
   <style>
	body{
		font-family: calibri;
		background-color: #E5F8F3;
	}

    label{
	     width: 5em;
	     float: left;
	     font-family: calibri;
    }

   	#head{
   		position: fixed;
   		background-color: white;
   		color: black;
   		top: 0;
   		left: 0;
   		width: 100%;
   		text-align: center;
   		border-bottom: 1px solid black;
   		z-index: 100;
   }

	#newPost{
   		float: right;
   		margin-right: 60px;
   		margin-bottom: 17px;
   }

   div.posts{
   		position: relative;
   		top: 150px;
   		background-color: white;
   		text-align: center;
   		margin: 0 auto;
   		border: 1px solid black;
   		margin-bottom: 10px;
   		width: 600px;
   }

   a{
   	text-decoration: none;
   	color: gray;
   }

   a:hover{
   	text-decoration: none;
   	color: blue;
   }

   #postcollection{
   		position: relative;
   		left: 99;
   }

   #profile{
   	position: fixed;
   	top: 130px;
   	left: 5;
   }

   #content{
   	margin-top: 20px;
   }

   a.button{
   		position: relative;
   		left: 270px;
   		top: -3px;
   		font-size: 8pt;
   }

   span.postBy{
   	z-index: 100;
	position: relative;
	top: 75px;
	left: -170px;
   }

    div.comments{
   		position: relative;
   		top: 140px;
   		left: 370px;
   }

   div.comment{
   		position: relative;
   		top: 137px;
   		background-color: #eaa3eb;
   		text-align: center;
   		margin: 0 auto;
   		border: 1px solid black;
   		margin-bottom: 10px;
   		width: 600px;
   }

   span.commentBy{
   	z-index: 100;
	position: relative;
	top: 57px;
	right: 160px;
   }

	a.commentByName{
   	font-weight: bold;
   	color: gray;
   }
   
   </style>
   </head>

   <!-- START BLOCK : profilePost -->
   <body>
   <div id="postcollection">
   <div id="head">
   <h1>Post list</h1>
   <a id="newPost" href="index.php?actie=toevoegen"><img src="png/rounded54.png" alt="" height="40" width="40"></a></br>
   </div>     

	<div class="posts">
	    <span class="postBy">Post geplaatst door: <a href="profile.php?id={profileID}">{VOORNAAM} {ACHTERNAAM}</a></span>
	    <p id="content">{OWNCONTENT}<br></p>
		<a class="button" href="index.php?actie=wijzigen&id={postId}"><button><img src="png/underline6.png" alt="" height="10" width="10"></button></a>
	    <a class="button" href="index.php?actie=verwijderen&id={postId}"><button><img src="png/clear5.png" alt="" height="10" width="10"></button></a>
	</div>
    </div>

<!-- START BLOCK : comments -->
    <div class="comment">
	    <span class="commentBy">Comment geplaatst door: <a class="commentByName"href="profile.php?id={profileID}">{VOORNAAM} {ACHTERNAAM}</a>
	    </span>
	    <div id="commentContent">{COMMENTS}</div></br>
	    <a class="button" href="index.php?actie=editComment&id={COMMENTID}"><button><img src="png/underline6.png" alt="" height="10" width="10"></button></a>
	    <a class="button" href="index.php?actie=deleteComment&id={COMMENTID}"><button><img src="png/clear5.png" alt="" height="10" width="10"></button></a>
    </div>
<!-- END BLOCK : comments -->

    <div class="comments">
    	<a href="index.php?actie=addComment&postId={postId}">Comment plaatsen</a>
    </div>

    <!-- END BLOCK : profilePost -->

	<div id="profile">
	<h1>Profiel</h1>
	
	<div class="personinfo">
		<p>Voornaam: 		{VOORNAAM}</p>
		<p>Achternaam: 		{ACHTERNAAM}</p>
		<p>Geslacht: 		{GESLACHT}</p>
		<p>Geboortedatum: 	{DOB}</p>
		<p>Adres: 			{ADRES}</p>
		<p>Postcode: 		{POSTCODE}</p>
		<p>Woonplaats: 		{WOONPLAATS}</p>
		<p>Telefoon: 		{TELEFOON}</p>
		<p>Mobiel: 			{MOBIEL}</p>
	</div>
	<a href="index.php">Homepage</a>
	<a href="logout.php">Logout</a>
	<a href="profile.php?actie=editProfile&id={ID}">Profiel wijzigen</a>
	</div>
</body>

</html>

<!-- END BLOCK : profile -->

<!-- START BLOCK : editProfile -->
<html>
<head>
	<title>Wall</title>
	<meta charset="utf-8">

	<style>
		body{
			position: absolute;

			background-size: 100% auto;
			top: 200;
			left: 520;
		}

		label{
			width: 9em;
			float: left;
		}

		h1, label, a{
			color: black;
			font-family: Calibri;
		}

		a{
			float: right;
			margin-right: 5px;
		}

	</style>
	</head>
	<body>
		<h1>Profiel wijzigen</h1>

		<form action="profile.php?actie=editProfile&id={profileID}" method="POST">
	
			<div class="personinfo">
				<label>Voornaam:</label>
				<input type="text" name="voornaam" value="{VOORNAAM}"></br>
				
				<label>Achternaam:</label>
				<input type="text" name="achternaam" value="{ACHTERNAAM}"></br>

				<label for="geslacht">Geslacht:</label>
				<input type="text" name="geslacht" value="{GESLACHT}"><br>

				<label>Geboortedatum:</label>
				<input type="text" name="geboortedatum" value="{DOB}"></br>

				<label>Adres:</label>
				<input type="text" name="adres" value="{ADRES}"></br>

				<label>Postcode:</label>
				<input type="text" name="postcode" value="{POSTCODE}"></br>

				<label>Woonplaats:</label>
				<input type="text" name="woonplaats" value="{WOONPLAATS}"></br>

				<label>Telefoon:</label>
				<input type="text" name="telefoon" value="{TELEFOON}"></br>

				<label>Mobiel:</label>
				<input type="text" name="mobiel" value="{MOBIEL}"></br>

				<input type="hidden" name="id" value="{profileID}">
				<input type="submit" name="submit">
			</div>
			</form>

			<a href="profile.php?id={profileID}">Terug</a>
<!-- END BLOCK : editProfile -->

<!-- START BLOCK : default -->

<!DOCTYPE html>
 <html>
  <head>
   <title>Wall</title>
   <meta charset="utf-8">

   <style>
    label{
     width: 5em;
     float: left;
         }
	 
	 body{
	 	background-image: url(background.jpg);
	 	background-repeat: no-repeat;
	 	background-size: 100%;	
	 }

	 p{
		font-style: Monospace;
		font-size: 20px;
	 }

	 div.links{
	 	position: absolute;
	 	top: 100px;
	 	z-index: 100;
	 }

   </style>
   </head>
   <body>

<!-- START BLOCK : post -->

 <!DOCTYPE html>
 <html>
  <head>
   <title>Wall</title>
   <meta charset="utf-8">

   <style>
	body{
		font-family: calibri;
		background-color: #E5F8F3;
	}

    label{
	     width: 5em;
	     float: left;
	     font-family: calibri;
    }

   	#head{
   		position: fixed;
   		background-color: white;
   		color: black;
   		top: 0;
   		left: 0;
   		width: 100%;
   		text-align: center;
   		border-bottom: 1px solid black;
   		z-index: 100;
   }

	#newPost{
   		float: right;
   		margin-right: 60px;
   		margin-bottom: 17px;
   }

   div.posts{
   		position: relative;
   		top: 150px;
   		background-color: white;
   		text-align: center;
   		margin: 0 auto;
   		border: 1px solid black;
   		margin-bottom: 10px;
   		width: 600px;
   }

   div.comments{
   		position: relative;
   		top: 140px;
   		left: 370px;
   }

   div.comment{
   		position: relative;
   		top: 137px;
   		background-color: #eaa3eb;
   		text-align: center;
   		margin: 0 auto;
   		border: 1px solid black;
   		margin-bottom: 10px;
   		width: 600px;
   }

   a{
   	text-decoration: none;
   	color: gray;
   }

   a:hover{
   	text-decoration: none;
   	color: blue;
   }

   a.button{
   		position: relative;
   		left: 270px;
   		top: -3px;
   		font-size: 8pt;
   }

   span.postBy{
   	z-index: 100;
	position: relative;
	top: 85px;
	left: -170px;
   }

   span.commentBy{
   	z-index: 100;
	position: relative;
	top: 57px;
	left: -150px;
   }

   #content{
   	margin-top: 20px;
   }

   #commentContent{
   	
   }

   div.links{
   	position: fixed;
   }

   a.postByName{
   	font-weight: bold;
   	color: gray;
   }

   a.commentByName{
   	font-weight: bold;
   	color: gray;
   }

   </style>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/demos/style.css">
   <script>
   $(function() {
    $( "a class='button'" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
   });
   </script>
   </head>
   <body>
   <div id="head">
	   <h1>Post list</h1>
	   <a id="newPost" href="index.php?actie=toevoegen"><img src="png/rounded54.png" alt="" height="40" width="40"></a></br>
   </div>     

	<div class="posts">
		<span class="postBy">Post geplaatst door: <a class="postByName"href="profile.php?id={profileID}">{VOORNAAM} {ACHTERNAAM}</a></span>
		<p id="content">{CONTENT}</br></p>
		<a class="button" href="index.php?actie=wijzigen&id={postId}"><button><img src="png/underline6.png" alt="" height="10" width="10"></button></a>
    <a class="button" href="index.php?actie=verwijderen&id={postId}"><button><img src="png/clear5.png" alt="" height="10" width="10"></button></a>
    </div>

<!-- START BLOCK : comments -->
    <div class="comment">
	    <span class="commentBy">Comment geplaatst door: <a class="commentByName"href="profile.php?id={profileID}">{VOORNAAM} {ACHTERNAAM}</a>
	    </span>
	    <div id="commentContent">{COMMENTS}</div></br>
	    <a class="button" href="index.php?actie=editComment&id={COMMENTID}"><button><img src="png/underline6.png" alt="" height="10" width="10"></button></a>
	    <a class="button" href="index.php?actie=deleteComment&id={COMMENTID}"><button><img src="png/clear5.png" alt="" height="10" width="10"></button></a>
    </div>
<!-- END BLOCK : comments -->

    <div class="comments">
    	<a href="index.php?actie=addComment&postId={postId}">Comment plaatsen</a>
    </div>

<!-- END BLOCK : post -->
	<div class="links">
		<a href="login.php?actie=registreren">Registreren</a>
		{LOGIN}
		<a href="profile.php?id={profileID}">Profile</a>
		<a href="logout.php">Logout</a>
	</div>
 
<!-- END BLOCK : default -->

		</body>
	</html>