<html>
<!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/registerStyles.css">
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/adminStyles.css">
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
    <h1 class="registerhead"></h1>

<body style="display:none;" class="homebody">
    <div>
        <h2 style="color:white;">Request to Add a Product</h2>
        <form method="POST" action="../home/addValidURL" >

            <div class="well">
                <label for="reqURL">Product Link </label> <br/>
                <input type="text" class="form-control urlbox" name="reqURL" placeholder="Product URL" /> <br/>
                <button type="submit" class="btn btn-primary btn-sm">Send Request</button>

            </div>

            

        </form>
    </div>
</body>

</html>