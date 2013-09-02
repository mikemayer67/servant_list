var isLogin;

$( "#login-dialog" ).dialog( 
                            { autoOpen:    false, 
                              width:       175,
                              dialogClass: "login-dialog",
                              position:    { my: "right top", at: "right bottom", of: $("#menubar") }, 
                              open:        handle_dialog_open,
                              close:       handle_dialog_close,
                              show:        {effect: "slide", direction: "up", delay: 50},
                              hide:        {effect: "slide", direction: "up", delay: 50},
                              buttons: [ 
                                { text: "OK",     id:'login-dialog-ok',     click: handle_login_ok     },
                              ]
} );

function setup_for_login() {
  isLogin = 1;
  $( "#username" ).text("Guest");
  $( "#loginText" ).text("Login");
  $( "#login" ).unbind('click');
  $( "#login" ).click( function() { $( '#login-dialog' ).dialog("open"); } );
  $( "#loginArrow" ).addClass('downArrow');
}

function setup_for_logout() {
  isLogin = 0;
  $( "#loginText" ).text("Logout");
  $( "#login" ).unbind('click');
  $( "#login" ).click( handle_logout );
  $( "#loginArrow" ).removeClass('downArrow').removeClass('upArrow');
}

$( "#userid-input" ).bind('input',watch_login_input);
$( "#passwd-input" ).bind('input',watch_login_input);

$( "#passwd-input" ).keypress( $('#userid-input'), handle_login_keypress );
$( "#userid-input" ).keypress( $('#passwd-input'), handle_login_keypress );

function handle_login_keypress( event ) {
  if( event.which===$.ui.keyCode.ENTER ) {
    if( ! $( "#login-dialog-ok" ).prop('disabled') ) {
      $( '#login-dialog-ok' ).click();
    }
  }
}

function handle_dialog_open()
{
  $(window).resize( function() {
    $("#login-dialog").dialog( "option","position", { my: "right top", at: "right bottom", of: $("#menubar") } );
  } );
  $(window).mouseup(function(x) { 
    if($(x.target).parents('.login-dialog').length<1) { $('#login-dialog').dialog('close'); }
  } );
  $("#login-error-msg").hide();
  $("#loginArrow").removeClass('downArrow').addClass('upArrow');
  $("#login").unbind("click");
}

function handle_dialog_close()
{
  $(window).unbind('resize');
  $(window).unbind('mouseup');
  if(isLogin) {
    $("#loginArrow").removeClass('upArrow').addClass('downArrow');
  } else {
    $("#loginArrow").removeClass('upArrow').removeClass('downArrow');
  }

  $( "#login" ).click( function() { $( '#login-dialog' ).dialog("open"); } );
}

function handle_login_ok()
{
  $userid   = $("#userid-input").val();
  $password = $("#passwd-input").val();
  $.ajax('index.php',
         { cache: false,
           dataType: "json", 
           timeout: 2000,
           data: {action: "verify_login", userid: $userid, password: $password },
           type: "POST",
           success: function(result) { handle_verify_result(result); },
           error: function(xhr,status) { 
             switch(status) {
               case 404: alert('File not found');          break;
               case 500: alert('Servor error');            break;
               case 0:   alert('Request aborted');         break;
               default:  alert('Unknown error ' + status);
             }
           }
         });
}

function handle_verify_result(x)
{
  if(x.state==0) {
    $("#login-error-msg").hide();
    alert("Result Returned\n"+x.userid+"\n"+x.username);
    clear_and_close_login();
    $("#username").text(x.username);
    setup_for_logout();
  } else { // invalid userid
    $("#login-error-msg").text(x.error).show();
    clear_password();
  }
}

function clear_password()
{
  $("#passwd-input").val("");
  $( "#login-dialog-ok" ).prop('disabled',true).addClass('ui-state-disabled');
}

function clear_and_close_login()
{
  clear_password();
  $("#login-dialog").dialog("close");
}

function watch_login_input()
{
  ok = 1;

  v = $("#userid-input").val();
  v = v.replace(" ","","g");
  if( v.length == 0 ) { ok = 0; } 

  v = $("#passwd-input").val();
  v = v.replace(" ","","g");
  if( v.length == 0 ) { ok = 0; } 

  if(ok) {
    $( "#login-dialog-ok" ).prop('disabled',false).removeClass('ui-state-disabled');
  } else {
    $( "#login-dialog-ok" ).prop('disabled',true).addClass('ui-state-disabled');
  }
  $( "#login-error-msg" ).hide();
}

function handle_logout()
{
  $.ajax('index.php',
         { cache: false,
           dataType: "json",
           data: {action: "logout" },
           type: "POST"
         });

  setup_for_login();
}
