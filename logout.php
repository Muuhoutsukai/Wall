<?php

session_start();
session_destroy($user);
header("Location:login.php?actie=login");

?>