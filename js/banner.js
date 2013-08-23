
$( "#login-dialog" ).dialog( { autoOpen: false, 
  width: 150,
  dialogClass:"login-dialog",
  position:{my: "right top", at: "right bottom", of: $("#banner") }, 
  open: handle_dialog_open,
  close: handle_dialog_close,
  show: {effect: "slide", direction: "up", delay: 250},
  hide: {effect: "slide", direction: "up", delay: 100},
  buttons: [ { text: "OK",     id:'login-dialog-ok', click: handle_login_ok },
             { text: "Cancel", click: handle_login_cancel} ]
  });

$( "#login" ).click(function() {
    $( "#login-dialog" ).dialog( "open" );
  });

$( "#userid-input" ).bind('input',watch_userid);


function handle_dialog_open()
{
  $(window).resize(function(){
    $("#login-dialog").dialog("option","position",{my: "right top", at: "right bottom", of: $("#banner")});
  });
  $("#login-error-msg").hide();
}

function handle_dialog_close()
{
  $(window).unbind('resize');
}

function handle_login_ok()
{
  $userid   = $("#userid-input").val();
  $password = $("#password-input").val();
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
  if(x.state==0)
  {
    $("#login-error-msg").hide();
    alert("Result Returned\n"+x.userid+"\n"+x.username+"\n"+x.id+"\n"+x.admin);
    clear_and_close_login();
  }
  else // invalid userid
  {
    $("#login-error-msg").text(x.error).show();
    $("#password-input").val("");
  }
}

function handle_verify_error(e)
{
  alert("Error " + e.message);
  clear_and_close_login();
}

function handle_login_cancel()
{
  clear_and_close_login();
}

function clear_and_close_login()
{
  $("#password-input").val("");
  $("#login-dialog").dialog("close");
}

function watch_userid()
{
  v = $("#userid-input").val();
  v = v.replace(" ","","g");
  if(v.length>0)
  {
    $( "#login-dialog-ok" ).prop('disabled',false).removeClass('ui-state-disabled');
  }
  else
  {
    $( "#login-dialog-ok" ).prop('disabled',true).addClass('ui-state-disabled');
  }
  $( "#login-error-msg" ).hide();
}
