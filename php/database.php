<?php
  
function get_db_connection()
{
  return new mysqli("localhost", "ctsServantList", "CareteachservE", "ctsServantList");
}

?>
