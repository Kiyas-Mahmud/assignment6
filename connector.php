<?php
$con = new mysqli('localhost', 'root', '', 'assignment_6');

if(!$con){
    die(mysqli_error($con));
}
?>