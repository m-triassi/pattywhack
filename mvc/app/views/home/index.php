<html>

 
    <!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>
    
    <!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
    
    <!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/indexStyles.css">

<script>
    window.onload = function () {
        $("body").fadeIn(950);
    };
</script>
    
<head>
    <title>Patty Whack</title>
</head>

<body style="display:none;" class="homebody">
    <?php include("includes/navbar.php"); ?>
    <?php include("includes/footer.php"); ?>
    <h1 class="topbanner">Welcome to Patty Whack.com<br />
        <small>Add some variety to your life</small>
    </h1>
    <form action="../home/placeOrder">
    <div class="form-group well webcontent">
        <p class="webcontent">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus sollicitudin est, ut laoreet enim consequat eget. In at lectus a ex maximus interdum eu id purus. In posuere vel libero in imperdiet. Praesent maximus feugiat rhoncus. Aliquam sed nulla facilisis, elementum felis vel, dictum purus. Donec lacinia nisi a massa scelerisque, in convallis magna maximus. Nulla placerat neque non aliquam venenatis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer fermentum est eget elit tincidunt, ut accumsan ligula faucibus.
                <br/>
            Aenean faucibus viverra placerat. Etiam ut est orci. Fusce ac posuere nunc. Etiam eu efficitur ante. Cras facilisis metus non varius faucibus. In fringilla pretium enim, nec pretium turpis ultricies a. Sed tincidunt ornare eros id tempor. Vivamus ullamcorper purus at augue bibendum, at rutrum tellus consequat.
        </p>
        <input type="submit" value="Place an Order" class="btn btn-outline-secondary black-background white" />
    </div>
        </form>

    </body>

</html>