<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-196175239-1%22%3E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-196175239-1');
</script>
<script type="text/javascript">
function getFileNameWithExt(event) {
    if (!event || !event.target || !event.target.files || event.target.files.length === 0) {
        return;
    }
    var name = event.target.files[0].name;
    document.getElementById("fileName").value = name;
}
</script>
<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

<meta charset="ISO-8859-1">
<title>Image Story Teller</title>
</head>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js%27);
fbq('init', '792744874973854');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=792744874973854&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->



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
        'into facebook for images.';
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
	    		var imgHtml= imgHtml + ' <div><img style="border: solid;" src=\"' + imageurl +'\" width=\"550px\"  height=\"250px\" onclick=imgOnclick("' + imageurl + '","' + imageId + '") ><div> <a class=\"info\" onclick=imgOnclick("' + imageurl + '","' + imageId + '")>Click here to Generate Story</a></div></div>';
	    		document.getElementById('status').innerHTML =imgHtml;
	  	    	  
	    		
	    	};
	      
	    });
	  }
function imgOnclick(src,id) {
	var hiddenInput = '<input type="hidden" name="hiddenField" value="' + src +'"/>';
    var hiddenInput2 = '<input type="hidden" name="Fb_image_id" value="' + id +'"/>';
    document.getElementById('imageform').innerHTML += hiddenInput;
    document.getElementById('imageform').innerHTML += hiddenInput2;
    document.getElementById('imageform').submit();
	  
}
  
  </script>
  <div align="center">
  <!-- <div style="border:thin; ; border-color: #ADD8E6; border-style: groove; background-color:#F0F8FF; opacity:inherit; width: 25%; height: 40px;" > -->
        <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
            <input type="file" name="myFile"  onChange='getFileNameWithExt(event)'   required="">
            <input type="hidden" id="fileName" name="fileName" />
            <input type="submit" value="Submit">
        </form>
      <!--  </div> -->
        <!-- <div style="border:thin; border-style: groove; border-color: #ADD8E6; background-color: #F0F8FF; width: 25%; height: 40px;"> -->
        <div>
        	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
			</fb:login-button>
        </div>
        <div id="status" align="center">
		</div>
		<!-- </div> -->
        <form action="<%= blobstoreService.createUploadUrl("/CloudVision") %>" id="imageform" method="post" enctype="multipart/form-data">
        	<div>
        		
        	</div>
        </form>
   </div>
</body>
</html>