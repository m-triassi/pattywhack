<html>

<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/registerStyles.css">


<script>
    window.onload = function () {
        $("body").fadeIn(950);
    };
</script>
    
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );
});
</script>

<head>
    <title>Patty Whack</title>
</head>
    <?php include("../public/includes/navbar.php"); ?>
    <h1 class="registerhead">Place your order</h1>

<body style="display:none;" class="homebody">

    <form method="POST" class="registerform" action="../home/shipping" >
        <div class="form-group">
            <label for="budgetBox">Order Budget: </label>
            <input type="number" required class="form-control" onkeyup="update()" name="budgetBox" id="budgBox"/>
        </div>
        <div class="form-group">
            <label for="budgetBox">Max Price/Item: </label>
            <input type="range" name="points" id="points" value="50" min="1" max=<?php echo $_SESSION['budgetBox']; ?> >
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>