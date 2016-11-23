<html>
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
      <?php include("includes/footer.php"); ?>
    
    <h1 class="registerhead">Login</h1>

<body style="display:none;" class="homebody">
    <?php 
    if(isset($data['message'])) { 
        echo "<div class='alert alert-danger' style='margin-top: 4%; font-size: 2em;'>$data[message]</div>";
     }?>
    <form method="POST" class="registerform" action="../home/logUser" >
        <div class="form-group">
            <label for="exampleInputEmail1">Username</label>
            <input type="text" class="form-control" name="UserLogin" placeholder="Username"  />
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Password</label>
            <input type="password" class="form-control" name="PasswordLogin" placeholder="Password"  />
        </div>
        <button type="submit" class="btn btn-default">Login</button>
    </form>
</body>

</html>