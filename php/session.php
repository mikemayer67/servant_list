<?php
session_start();  

include('php/database.php');

function session_views()
{
  if(isset($_SESSION['views']))
  {
    $_SESSION['views'] += 1;
  }
  else
  {
    $_SESSION['views'] = 1;
  }
  return $_SESSION['views'];
}

function session_userid()
{
  return (isset($_SESSION['userid']) ? $_SESSION['userid'] : -1);
}

function session_username()
{
  $id = session_userid();
  return ($id<0 ? 'Guest' : $_SESSION['username']);
}

function session_userrole()
{
  $id = session_userid();
  return "(role $id)";
}

function verify_login()
{
  $userid   = isset($_REQUEST['userid'])   ? $_REQUEST['userid']   : "";
  $password = isset($_REQUEST['password']) ? $_REQUEST['password'] : "";
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

    $res = $db->query("select id,username,password,admin from users where userid='$userid'");

    $n = $res->num_rows;
    if($n==0)
    {
      error_log("Invalid user: $userid");
      throw new Exception("Invalid login",3);
    }

    $userdata = $res->fetch_assoc();  // should only be one match!

    if(strlen($password)==0)
    {
      error_log("Empty password for '$userid'");
      throw new Exception("Invalid login",4);
    }

    $password    = urlencode($password);
    $user_passwd = $userdata["password"];

    if( strlen($user_passwd)==0 )
    {
      $chars='./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; 
      $salt='$2y$07$'; 
      for($i=0;$i<21;$i++) $salt.=$chars[rand(0,63)]; 
      $user_passwd = crypt($password,$salt);
      $db->query("update users set password='$user_passwd' where userid='$userid'");
      error_log("Set password for user $userid");
    }
    else
    {
      $salt = substr($user_passwd,0,28);
      $password = crypt($password,$salt);
      if( strcmp($password,$user_passwd) )
      {
        error_log("Invalid password entered for '$userid'");
        throw new Exception("Invalid login",5);
      }
    }

    $_SESSION['userid']   = $userid;
    $_SESSION['username'] = $userdata['username'];
    $_SESSION['admin']    = $userdata['admin'];
    $_SESSION['id']       = $userdata['id'];

    $rval = array( "state"=>0, 
                   "userid"=>$userid, 
                   "username"=>$userdata["username"], 
                   "id"=>$userdata["id"], 
                   "admin"=>$userdata["admin"] );
  }
  catch(Exception $e)
  {
    $rval = array( "state"=>$e->getCode(), "error"=>$e->getMessage() );
  }

  print json_encode($rval);
  return;
}
?>

