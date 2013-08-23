<?php
  
function get_db_connection()
{
  return new mysqli("localhost", "cts_sl_php", "CareteachservE", "cts_servant_list");
}

?>
