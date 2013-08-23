<?php

function load_view($view)
{
  $path = 'views/'.$view.'_html.php';
  include($path);
}
?>
