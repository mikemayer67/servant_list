var userIsLoggedIn=0;

//
// login actions
//

function handle_login(username) {
  alert('handle_login');
  userIsLoggedIn=1;
  $( "#mb-username").text(username);
  $( "#loginText" ).text("Logout");
  $( "#mb-login" ).unbind('click');
  $( "#mb-login" ).click( handle_logout );
  $( "#loginArrow" ).removeClass('mb-down-arrow').removeClass('mb-up-arrow');
}

function handle_logout(username)
{
  alert('handle_logout');
  $.ajax('index.php',
         { cache: false,
           dataType: "json",
           data: {action: "logout" },
           type: "POST"
         });

  userIsLoggedIn=0;
  $( "#mb-username" ).text("Guest");
  $( "#loginText" ).text("Login");
  $( "#mb-login" ).unbind('click');
  $( "#mb-login" ).click( function() { $( '#login-dialog' ).dialog("open"); } );
  $( "#loginArrow" ).addClass('mb-down-arrow');
}
//
// login dialog box
//

$( "#login-dialog" ).dialog( 
                            { autoOpen:    false, 
                              width:       175,
                              dialogClass: "login-dialog",
                              position:    { my: "right top", at: "right bottom", of: $("#menubar") }, 
                              open:        handle_login_dialog_open,
                              close:       handle_login_dialog_close,
                              show:        {effect: "slide", direction: "up", delay: 50},
                              hide:        {effect: "slide", direction: "up", delay: 50},
                              buttons: [ 
                                { text: "OK",     id:'login-dialog-ok',     click: handle_login_dialog_ok     },
                              ]
} );

$( "#userid-input" ).bind('input',watch_login_input);
$( "#passwd-input" ).bind('input',watch_login_input);

$( "#passwd-input" ).keypress( $('#userid-input'), handle_login_dialog_keypress );
$( "#userid-input" ).keypress( $('#passwd-input'), handle_login_dialog_keypress );

function handle_login_dialog_open()
{
  $(window).resize( function() {
    $("#login-dialog").dialog( "option","position", { my: "right top", at: "right bottom", of: $("#menubar") } );
  } );
  $(window).mouseup(function(x) { 
    if($(x.target).parents('.login-dialog').length<1) { $('#login-dialog').dialog('close'); }
  } );
  $("#login-error-msg").hide();
  $("#loginArrow").removeClass('mb-down-arrow').addClass('mb-up-arrow');
  $("#mb-login").unbind("click");
}

function handle_login_dialog_close()
{
  $(window).unbind('resize');
  $(window).unbind('mouseup');
  if(userIsLoggedIn) {
    $("#loginArrow").removeClass('mb-up-arrow').removeClass('mb-down-arrow');
  } else {
    $("#loginArrow").removeClass('mb-up-arrow').addClass('mb-down-arrow');
  }

  $( "#mb-login" ).click( function() { $( '#login-dialog' ).dialog("open"); } );
}

function handle_login_dialog_keypress( event ) {
  if( event.which===$.ui.keyCode.ENTER ) {
    if( ! $( "#login-dialog-ok" ).prop('disabled') ) {
      $( '#login-dialog-ok' ).click();
    }
  }
}

function handle_login_dialog_ok()
{
  $userid   = $("#userid-input").val();
  $password = $("#passwd-input").val();
  $.ajax('index.php',
         { cache: false,
           dataType: "json", 
           timeout: 2000,
           data: {action: "verify_login", userid: $userid, password: $password },
           type: "POST",
           success: function(result) { handle_verify_login_result(result); },
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

function handle_verify_login_result(x)
{
  if(x.state==0) {
    $("#login-error-msg").hide();
    for (var key in x) {
      if($.isPlainObject ( x[key] )) {
        for (var kkey in x[key] ) {
          $('body pre').before('<div class=result-x>'+key+'['+kkey+']: '+x[key][kkey]+'</div>');
        }
      } else {
        $('body pre').before('<div class=result-x>'+key + ': ' + x[key]+'</div>');
      }
    }
    close_login_dialog();
    handle_login(x.username);
  } else { // invalid userid
    $("#login-error-msg").text(x.error).show();
    clear_login_password();
  }
}

function clear_login_password()
{
  $("#passwd-input").val("");
  $( "#login-dialog-ok" ).prop('disabled',true).addClass('ui-state-disabled');
}

function close_login_dialog()
{
  $("#passwd-input").val("");
  $( "#login-dialog-ok" ).prop('disabled',true).addClass('ui-state-disabled');
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

