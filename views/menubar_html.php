<link rel=stylesheet href="css/menubar.css" />

<div id=menubar class=ui-widget-header>
  <img id=ctslogo class=menubar-text src="graphics/cts_logo.png"/>
  <div id=menubar-left>
    <span id=pagetitle class=menubar-text>CTS Servant List</span>
  </div>
  <div id=menubar-right>
    <span id=mb-role class=menubar-text>(role text)</span>
    <span id=mb-username class=menubar-text>(username)</span>
    <span id=mb-login class=menubarbutton><span id=loginText>(login text)</span><span id=loginArrow class='mb-arrow-icon'></span></span>
  </div>
</div>

<div id=login-dialog title="Login" class="ui-widget-content">
<form autocomplete="on">
<strong>User ID:</strong>
<br/>
<input type=text size=15 name=userid-input id=userid-input />
<br/>
<strong>Password:</strong>
<br/>
<input type=password size=15 name=passwd-input id=passwd-input />
<div id="login-error-msg" class=ui-state-error>junk</div>
</form>
</div>
 
<script src="js/menubar.js"></script>
<script><?php $x=(is_logged_in() ? 'login' : 'logout'); $name=session_username(); echo "handle_$x('$name');" ?></script>

