<link rel=stylesheet href="css/menubar.css" />

<div id=menubar class=ui-widget-header>
  <img id=ctslogo class=menubar-text src="graphics/cts_logo.png"/>
  <div id=menubar-left>
    <span id=pagetitle class=menubar-text>CTS Servant List</span>
  </div>
  <div id=menubar-right>
    <span id=currentrole class=menubar-text>(role text)</span>
    <span id=username class=menubar-text>
    <?php echo session_username(); ?></span>
    <span id=login class=menubarbutton><span id=loginText>(login text)</span><span id=loginArrow class='downArrow'></span></span>
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
<script><?php $x=(is_logged_in() ? 'logout' : 'login'); echo "setup_for_$x();" ?></script>

