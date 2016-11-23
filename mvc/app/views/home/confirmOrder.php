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
    <h1 class="registerhead">Confirm your Order</h1>
    

<body style="display:none;" class="homebody">

    <form method="POST" class="registerformclose" action="../home/payment" >
        
        <div class="well table-responsive"  style="color: black;">
            <h2>Your Invoice</h2> <br/>
            <table class="table">
                <tr>
                    <th><p>Username:</p></th> 
                    <td><span name="user" ><?php if(!empty($_SESSION['user']))echo $_SESSION['user']; ?></span></td>
                </tr>
                
                <tr>
                    <th><p>Address:</p></th> 
                    <td><span name="address">#VALUE</span></td>
                </tr>
                
                <tr>
                    <th><p>Postal Code:</p></th> 
                    <td><span name="postalCode">#VALUE</span></td>
                </tr>
                
                <tr>
                    <th><p>State/Province:</p></th> 
                    <td><span name="province">#VALUE</span></td>
                </tr>
                
            </table>
                <br/><br/><br/>
                
            <table class="table">
                <tr>
                    <th><p>Shipping Cost:</p></th> 
                    <td><span name="shippingCost">#VALUE</span></td>
                </tr>
                
                <tr>
                    <th><p>Order Cost:</p></th> 
                    <td><span name="orderCost">#VALUE</span></td>
                </tr>
                
                <tr>
                    <th><p>Total:</p></th> 
                    <td><span name="totalCost">#VALUE</span></td>
                </tr>
                
            </table>
        </div>
        
        <button type="submit" class="btn btn-default">Place Order</button>
    </form>
</body>

</html>