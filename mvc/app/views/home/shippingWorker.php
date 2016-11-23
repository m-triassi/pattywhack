<html>
<!-- JQuery -->
<script src="/pattywhack/mvc/public/jquery-3.1.1.min.js"></script>
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Shrikhand" rel="stylesheet">
<!-- Style Sheets -->
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/registerStyles.css">
<link rel="stylesheet" type="text/css" href="/pattywhack/mvc/public/stylesheets/adminStyles.css">
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

    <h1 class="registerhead">Shipping Worker Controls</h1>

<body style="display:none;padding-bottom:200px;" class="homebody">

    <form method="POST" class="general" action="../home/" >
        
        <div class="form-group well" style="height:700px;overflow-y:auto;">
            <table class="table table-striped">
                
                <tr><th>Order ID</th><th>Ordered By</th><th>Date Placed</th><th>Shipping Address</th><th>Tracking Number</th><th>Order Status</th><th>Delete Order</th><th>Mark as Shipped</th> </tr>
                
                <?php 
                
                
                    $orders = $this->model('orders');
                    $userOrders = $orders->get();
                    //var_dump($orders);
                    for ($k = 0; $k < $orders->count(); $k++)
                    {
                        echo "<tr>";
                        echo "<td>" . $userOrders->get($k)->order_id . "</td>";
                        echo "<td>" . $userOrders->get($k)->username . "</td>";
                        echo "<td>" . $userOrders->get($k)->date . "</td>";
                        echo "<td>" . $userOrders->get($k)->shipping_address . "</td>";
                        echo "<td><input type=number value=" . $userOrders->get($k)->tracking_number . "> <a href=../home/setTracking/" . $userOrders->get($k)->order_id . ">Set</a></td>";
                        echo "<td>" . $userOrders->get($k)->status_id . "</td>";
                        echo "<td><a href=../home/deleteOrder/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-remove'</a></td>";
                        echo "<td><a href=../home/setShipped/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-send'</a></td>";
                    }
                    
                ?>
            
            </table>
        
            
        </div>
    </form>
</body>

</html>