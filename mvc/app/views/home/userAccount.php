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
    <?php include("../public/includes/navbar.php"); ?>
    <h1 class="registerhead"></h1>

<body style="display:none;" class="homebody">

    <form method="POST" action="../home/" >
        <h2>Modify Account Details</h2>
        <div class="form-group well">
            <label for="oldPassBox">Old Password: </label>
            <input type="text" required class="form-control" name="oldPassBox" placeholder="Old Password" />
            
            <label for="NewPassBox">New Password: </label>
            <input type="text" required class="form-control" name="NewPassBox" placeholder="New Password" />
            
            <label for="conNewPassBox">Confirm New Password: </label>
            <input type="text" required class="form-control" name="conNewPassBox" placeholder="Confirm New Password" />
            
            <label for="addrBox">New Address: </label>
            <input type="text" required class="form-control" name="addrBox" placeholder="New Address" />
            
            <label for="postalBox">New Postal Code: </label>
            <input type="text" required class="form-control" name="postalBox" placeholder="New Postal Code" />
        </div>
        
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>