<html>
<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- JQuery -->
<script src="jquery-3.1.1.min.js"></script>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/registerStyles.css">
<script>
    window.onload = function () {
        $("body").fadeIn(950);
    };
</script>

<head>
    <title>Patty Whack</title>
</head>
    <?php include("/pattywhack/mvc/public/includes/navbar.html"); ?>
    
    <h1 class="registerhead">Register your Account</h1>

<body style="display:none;" class="homebody">
    <form method="post" class="registerform">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="EmailBox" placeholder="Email">
        </div>
        <div class="form-group">
            <label for="exampleInputUsername1">Username</label>
            <input type="text" class="form-control" id="UsernameBox" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="PasswordBox" placeholder="Password"> 
        </div>
        <div class="form-group">
            <label for="exampleInputAddress1">Address</label>
            <input type="text" class="form-control" id="AddressBox" placeholder="Address">
        </div>
        <div class="form-group">
            <label for="exampleInputPostalCode1">PostalCode</label>
            <input type="text" class="form-control" id="PostalCodeBox" placeholder="Postal Code">
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" > I agree to the <a href="terms.html" target="_blank">Terms of Service </a> </label>
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>