<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Tourism portal user SignUp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="asset/css/user_reg.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<script type="text/javascript">
function foreign()
{
	document.getElementById('forn').style.display='block';
	document.getElementById('natv').style.display='none';
}
function nativ()
{
	document.getElementById('natv').style.display='block';
	document.getElementById('forn').style.display='none';
}
function valid()
{
	document.getElementById('valid').style.display='block';
}
function valid1()
{
	document.getElementById('valid1').style.display='block';
}
</script>
<body>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Tourism Portal</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<input class="input-radio100" type="radio" name="category" value="foreigner" onclick="foreign()">&nbsp;&nbsp;Foriegn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="input-radio100" type="radio" name="category" value="native" onclick="nativ()">&nbsp;&nbsp;India
				<br/><br/>		
						<div style="display:none" id="forn">
				<form action="foreignprocess.jsp" method="post">
				<label>Name</label>
				
					<input class="text" type="text" name="fullname" placeholder="Full Name" required="" >
					<br/><label>Contact Number</label><input class="text" type="text" name="number" placeholder="Contact Number" required="">
					
					<br/><label>Nationality</label><input class="text" type="text" name="nationality" placeholder="Nationality" required="">
					<br/><label>Current Address</label><input class="text" type="text" name="address" placeholder="Address" required="">
					<br/><label>Street Name</label><input class="text" type="text" name="street" placeholder="Street Name" required="">
					<br/><label>City</label><input class="text" type="text" name="city" placeholder="City" required="">
					
					<br/><label>ID Proof</label><input class="radio" type="radio" name="vid" value="passport" onclick="valid()">passport
					<input class="radio" type="radio" name="vid" value="licence" onclick="valid()">Licence
					<br/><p id="valid" style="display:none"><input class="text" type="text" name="id" required="" placeholder="Id Proof number"></p>
					
					<br/><label>Email</label><input class="text" type="email" name="email" placeholder="Email" required="">
					<br/><label>Password</label><input class="text" type="password" name="password" placeholder="Password" required="">
					<br/><label>Confirm Password</label><input class="text" type="password" name="password0" placeholder="Confirm Password" required="">
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" class="checkbox" required="">
							<span>I Agree To The Terms & Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGNUP">
				</form>
			</div>
			<div style="display:none" id="natv">
				<form action="nativeprocess.jsp" method="post">
				<label>Name</label>
				
					<input class="text" type="text" name="fullname1" placeholder="Full Name" required="" >
					<br/><label>Contact Number</label><input class="text" type="text" name="number1" placeholder="Contact Number" required="">
					
					<br/><label>Nationality</label><input class="text" type="text" name="nationality1" placeholder="Nationality" required="">
					<br/><label>Current Address</label><input class="text" type="text" name="address1" placeholder="Address" required="">
					<br/><label>City</label><input class="text" type="text" name="city1" placeholder="City" required="">
					<br/><label>State</label><input class="text" type="text" name="state1" placeholder="State" required="">
					<br/><label>Pincode</label><input class="text" type="text" name="pincode1" placeholder="Pincode" required="">
					
					<br/><label>ID Proof</label><input class="radio" type="radio" name="vid1" value="passport" onclick="valid1()">passport
					<input class="radio" type="radio" name="vid1" value="licence" onclick="valid1()">Licence
					<input class="radio" type="radio" name="vid1" value="adhaar" onclick="valid1()">Adhaar
					<input class="radio" type="radio" name="vid1" value="voterid" onclick="valid1()">Voters Id
					<br/>
					<p id="valid1" style="display:none"><input class="text" type="text" name="id1" required="" placeholder="Id Proof number"></p>
					
					
					<br/><label>Email</label><input class="text" type="email" name="email1" placeholder="Email" required="">
					<br/><label>Password</label><input class="text" type="password" name="password1" placeholder="Password" required="">
					<br/><label>Confirm Password</label><input class="text" type="password" name="password11" placeholder="Confirm Password" required="">
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" class="checkbox" required="">
							<span>I Agree To The Terms & Conditions</span>
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGNUP">
				</form></div>
<p>Don't have an Account? <a href="index.jsp"> Login Now!</a></p>
			 			</div>
		<div>
<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<div>
<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	</div>
	<!-- //main -->
</body>
</html>