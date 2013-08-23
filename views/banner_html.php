<link rel=stylesheet href="style/banner.css" />

<div id=banner>
  <img id=ctslogo class=banner-text src="graphics/cts_logo.png"/>
  <div id=banner-left>
    <span id=pagetitle class=banner-text>CTS Servant List</span>
  </div>
  <div id=banner-right>
    <span id=userrole class=banner-text>
      <?php echo session_userrole(); ?>
    </span>
    <span id=username class=banner-text>
      Welcome <?php echo session_username(); ?>
    </span>
    <span id=login class=bannerbutton>
      <?php echo (session_userid()<0 ? 'Login' : 'Logout'); ?>
    </span>
  </div>
</div>

<div id=login-dialog title="Login" class="ui-widget-content">
<form autocomplete="on">
<strong> User ID:</strong>
<br/>
<input type=text size=15 name=userid-input id=userid-input />
<br/>
<strong>Password:</strong>
<br/>
<input type=password size=15 name=password-input id=password-input />
<div id="login-error-msg">junk</div>
</form>
</div>
 
<script src="js/banner.js"></script>

