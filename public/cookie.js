var script = document.createElement('script');
    script.type = 'text/javascript';

    script.src = 'https://code.jquery.com/jquery-3.6.1.min.js';
    document.body.appendChild(script);

if(document.cookie.lastIndexOf('analyticsliv-cookie-consent') === -1){
  $("body").append("<div id='consent-div' style='position:fixed; bottom:0; width:100%;height:100px;z-index:100; background-color: yellow;'><button onclick='acceptall()'>Accept All</button><button onclick='rejectall()'>Reject</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' id='press' name='source' value='press'><label for='press' style='position:relative; top:17px;'>Analytics</label>&nbsp;<input type='checkbox' id='press' name='source' value='press' ><label for='press' style='position:relative; top:17px;'>Advertisement</label>&nbsp;<input type='checkbox' id='press' name='source' value='press' ><label for='press' style='position:relative; top:17px;'>Important</label>&nbsp;<input type='checkbox' id='press' name='source' value='press' ><label for='press' style='position:relative; top:17px;'>Necessary</label><button onclick='savepref()'>Save Preference</button></div>");
 }
  
  
  function acceptall(){
    $('#consent-div').hide();
    createCookie('analyticsliv-cookie-consent', 'analytics:yes,advertise:yes,necessary:yes,important:yes', 100);
  }
  
  function rejectall(){
    $('#consent-div').hide();
    createCookie('analyticsliv-cookie-consent', 'analytics:no,advertise:no,necessary:no,important:no,', 100);
  }
  
  function savepref(){
    $('#consent-div').hide();
    createCookie('analyticsliv-cookie-consent', 'analytics:yes,advertise:yes,necessary:yes,important:yes', 100);
  }
  
  
  
  
  
function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}