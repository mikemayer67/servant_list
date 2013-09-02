<?php
session_start();  

include_once('php/database.php');
include_once('php/coordinators.php');

function is_logged_in()
{
  return isset($_SESSION['userid']);
}

function session_userid()
{
  return (is_logged_in() ? $_SESSION['userid'] : "");
}

function session_username()
{
  return (is_logged_in() ? $_SESSION['username'] : "Guest");
}

function handle_logout()
{
  error_log("handle_logout");
  session_destroy();
  session_start();
}

function show_session_variables()
{
  if(is_logged_in())
  {
    $_SESSION['count'] = (isset($_SESSION['count']) ? 1+$_SESSION['count'] : 1);
    $n = $_SESSION['count'];
    $x = 'Yes';
  } else
  {
    $n = 0;
    $x = 'No';
  }
  echo "<h2>Session_count: $n  Logged in: $x</h2>\n";
}

function verify_login()
{
  $userid = isset($_REQUEST['userid'])   ? $_REQUEST['userid']   : "";
  $passwd = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
  preg_replace('/\s+/','',$userid);

  try
  {
    if(strlen($userid) == 0)
    {
      throw new Exception("Userid Not Specified",1);
    }

    $db = get_db_connection();
    if($db->connect_error)
    {
      $err = "Failed Database Connection: ".$db->connect_error;
      error_log($err);
      throw new Exception($err,2);
    }

    $res = $db->query("select userid,password,name,admin from people where userid='$userid'");

    $n = $res->num_rows;
    if($n==0)
    {
      error_log("Unknown userid: $userid");
      throw new Exception("Invalid login",3);
    }

    $userdata = $res->fetch_assoc();  // should only be one match!
    $res->close();

    if(strlen($passwd)==0)
    {
      error_log("Empty password for '$userid'");
      throw new Exception("Invalid login",4);
    }

    $passwd    = urlencode($passwd);
    $db_passwd = $userdata['password'];
    $name      = $userdata['name'];
    $admin     = intval($userdata['admin']);

    if( strlen($db_passwd)==0 )
    {
      $chars='./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; 
      $salt='$2y$07$'; 
      for($i=0;$i<21;$i++) $salt.=$chars[rand(0,63)]; 
      $db_passwd = crypt($passwd,$salt);
      $db->query("update people set password='$db_passwd' where userid='$userid'");
      error_log("Set password for user $userid");
    }
    else
    {
      $salt = substr($db_passwd,0,28);
      $passwd = crypt($passwd,$salt);
      if( strcmp($passwd,$db_passwd) )
      {
        error_log("Invalid password entered for '$userid'");
        throw new Exception("Invalid login",5);
      }
    }

    $_SESSION['userid']   = $userid;
    $_SESSION['username'] = $name;
    $_SESSION['admin']    = $admin;
    $_SESSION['roles']    = $roles;

    $rval = array( "state"=>0, 
                   "userid"=>$userid, 
                   "username"=>$name,
                   "admin"=>$admin);

    $roles = lookup_roles($userid);
    if($roles) { 
      $rval['roles'] = $roles; 
    }

  }
  catch(Exception $e)
  {
    $rval = array( "state"=>$e->getCode(), "error"=>$e->getMessage() );
  }

  $rval = json_encode($rval);
  print $rval;
  error_log($rval);
  return;
}
?>

