<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>

<body>
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      //testAPI();
      pic();
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }
  
  function test(){
	  FB.login(function()
	{   FB.api('/me/feed', 'post', {message: 'Hello, world!'});  }, {scope: 'publish_actions'});
	  document.getElementById('status').innerHTML = 'The publish_actions permission was deprecated and removed'
	  + ' 3 years ago now. <br>Im not going to spend the time to look for an alternative to a 3 years outdated assignment that should be up to date.<br>'
	  + 'see <a href="https://developers.facebook.com/blog/post/2018/04/24/new-facebook-platform-product-changes-policy-updates/">this link</a>'
	  + ' under Facebook Login section for details.';
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '792744874973854',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v10.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
    
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields: 'name,email,last_name,first_name,birthday,gender'}, function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!<br>'
        + 'Step 1: '+ '<br>'
        + 'Email: ' + response.email + '<br>'
        + 'First: ' + response.first_name + '<br>'
        + 'Last: ' + response.last_name + '<br><br>'
        + 'Step 4: ' + '<br>'
        + 'Birthday: ' + response.birthday + '<br>'
        + 'Gender: ' + response.gender;
    });
  }
  
  function pic() {           
	    FB.api('/me/photos/uploaded', {fields: 'id,name,images'}, function(response) {
	    	var idstring = JSON.stringify(response.data);
	    	var imgHtml = '';
	    	var url = '';
	    	for(var i = 0; i < response.data.length; i++) {
	    		var imageId = response.data[i]['id'];
	    		var imgages=response.data[i]['images'];
	    		var imageurl= imgages[i]['source'];
	    		var imgHtml= imgHtml + ' <img src=\"' + imageurl +'\" width=\"550px\" height=\"250px\"><div> <a class=\"info\" onclick=imgOnclick("' + imageurl + '","' + imageId + '")>Click here to Generate HashTag</a></div>';
	    		document.getElementById('status').innerHTML =imgHtml;
	  	    	  
	    		
	    	};
	      
	    });
	  }
  function imgOnclick(src,id) {
	  
	  
  }
  

</script>


<!-- The JS SDK Login Button -->
<div align="center">
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
</div>

<div id="status" align="center">
</div>


<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>