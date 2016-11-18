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
    <h1 class="registerhead">Enter Your Shipping Details</h1>

<body style="display:none;" class="homebody">

    <form method="POST" class="registerformclose" action="../home/confirmOrder" >
        
        <div class="form-group">
            <label for="email">Email </label>
            <input type="text" required class="form-control" name="email" placeholder="Email" />
        </div>
        
        
        <div class="form-group">
            <label for="ShipAddr">Shipping Address </label>
            <input type="text" required class="form-control" name="ShipAddr" placeholder="Shipping Address" />
        </div>
        
        
        <div class="form-group">
            <label for="postalCode">Postal/Zip Code </label>
            <input type="text" required class="form-control" name="postalCode" placeholder="Postal/Zip Code" />
        </div>
        
        
        <div class="form-group">
            <label for="city">City </label>
            <input type="text" required class="form-control" name="city" placeholder="City" />
        </div>
        
        
        <div class="form-group">
            <label for="province">State/Province </label>
            <input type="text" required class="form-control" name="province" placeholder="State/Province" />
        </div>
        
        
        <div class="form-group">
            <label for="contry">Country </label>
            <input type="text" required class="form-control" name="contry" placeholder="Country" />
        </div>
        
        <div class="form-group">
            <label for="shipCost">Total Shipping Cost: </label>
            <input name="shipCost" type="number" disabled style="float: right;">
        </div>
                
        <button type="submit" class="btn btn-default">Confirm</button>
    </form>
</body>

</html>