<html>
<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>
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
        <?php include("../public/includes/navbar.html"); ?>
    
    <h1 class="registerhead">Login</h1>

<body style="display:none;" class="homebody">
    <form method="POST" class="registerform" action="../home/" >
        <div class="form-group">
            <label for="exampleInputEmail1">Username</label>
            <input type="text" required class="form-control" name="UserLogin" placeholder="Username" />
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="password" required class="form-control" name="PasswordLogin" placeholder="Password" />
        </div>
        <button type="submit" class="btn btn-default">Login</button>
    </form>
</body>

</html>