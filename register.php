<html>
<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- JQuery -->
<script src="jquery-3.1.1.min.js"></script>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="stylesheets/registerStyles.css">
<script>
    window.onload = function () {
        $("body").fadeIn(950);
    };
</script>

<head>
    <title>Patty Whack</title>
</head>
    <?php include("includes/navbar.html"); ?>
    
    <h1 class="registerhead">Register your Account</h1>

<body style="display:none;" class="homebody">
    <form class="registerform">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
        </div>
        <div class="form-group">
            <label for="exampleInputUsername1">Username</label>
            <input type="text" class="form-control" id="exampleInputUsername1" placeholder="Username">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"> 
        </div>
        <div class="form-group">
            <label for="exampleInputAddress1">Address</label>
            <input type="text" class="form-control" id="exampleInputAddress1" placeholder="Address">
        </div>
        <div class="form-group">
            <label for="exampleInputPostalCode1">PostalCode</label>
            <input type="text" class="form-control" id="exampleInputPostalCode1" placeholder="Postal Code">
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" required oninvalid="this.setCustomValidity('You Must Agree to the terms of service if you wish to continue')" > I agree to the <a href="terms.html" target="_blank">Terms of Service </a> </label>
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>