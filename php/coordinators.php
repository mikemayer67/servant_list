<?php

include_once('php/database.php');

function lookup_roles($userid)
{
  $db = get_db_connection();

  $res = $db->query("select a.list,a.description from lists a,coordinators b where a.list=b.list and b.userid='$userid'");
  if($res)
  {
    while($row = $res->fetch_row())
    {
      $roles[$row[0]] = $row[1];
    }
    $res->close();
    $_SESSION['roles'] = $roles;
  }

  return $roles;
}

?>
