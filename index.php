<?php 
include('php/session.php'); 
include('php/core_funcs.php');
?>

<?php
  error_log( isset($_REQUEST['action']) ? $_REQUEST['action'] : 'no args' );

  if(isset($_REQUEST['action']))
  {
    $action = $_REQUEST['action'];
    switch($action)
    {
    case 'verify_login': verify_login();  break;
    case 'logout':       handle_logout(); break;
    default:
      echo "default action for $action\n";
      break;
    }
  }
  else
  {
    show_session_variables();
    load_view('home');
  }
?>

