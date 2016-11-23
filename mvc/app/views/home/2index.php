hello <?=$data['name']
// Below is a basic page
?>

<html>
<!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/registerStyles.css">
<!-- Includes -->
    <?php include("../public/includes/navbar.php"); ?>
    <?php include("includes/footer.php"); ?>
    
    
<script>
    window.onload = function () {
        $("body").fadeIn(950);
    };
</script>

<head>
    <title>Patty Whack</title>
</head>

    <h1 class="registerhead"></h1>

<body style="display:none;" class="homebody">

    <form method="POST" class="registerform" action="../home/" >
        
        <div class="form-group">
            <label for=""> </label>
            <input type="text" required class="form-control" name="" placeholder="" />
        </div>
        
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>