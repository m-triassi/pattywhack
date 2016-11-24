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

    
        
        <div class="form-group well" style="height:700px;overflow-y:auto;">
            <table class="table table-striped">
                
                
                <tr><th style="width:15px;">View Contents</th><th>Order ID</th><th>Ordered By</th><th>Date Placed</th><th>Shipping Address</th><th>Tracking Number</th><th>Order Status</th><th style="width:15px;">Delete Order</th><th style="width:15px;">Mark as Shipped</th><th style="width:15px;">Mark as Complete</th> </tr>
                
                <?php 
                
                
                    $orders = $this->model('orders');
                    $userOrders = $orders->get();
                    //var_dump($orders);
                    for ($k = 0; $k < $orders->count(); $k++)
                    {
                        if($userOrders->get($k)->status_id == 1)
                            $status = "Pending";
                        elseif ($userOrders->get($k)->status_id == 8)
                            $status = "Shipped";
                        else
                            $status = "Complete";
                        
                        
                        echo "<form method=POST class=general action=../home/setTracking >";
                        echo "<tr>";
                        echo "<td><a href=../home/viewOrder/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-eye-open'</a></td>";
                        echo "<td>" . $userOrders->get($k)->order_id . "</td>" . "<input type=hidden value=" . $userOrders->get($k)->order_id . " name=orderID >";
                        echo "<td>" . $userOrders->get($k)->username . "</td>";
                        echo "<td>" . $userOrders->get($k)->date . "</td>";
                        echo "<td>" . $userOrders->get($k)->shipping_address . "</td>";
                        echo "<td><input type=number name=track value=" . $userOrders->get($k)->tracking_number . "> <button type='submit' class='btn btn-sm btn-success'>Set</button></td>";
                        echo "<td>" . $status . "</td>";
                        echo "<td><a href=../home/deleteOrder/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-remove'</a></td>";
                        echo "<td><a href=../home/setShipped/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-send'</a></td>";
                        echo "<td><a href=../home/setComplete/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-ok'</a></td>";
                        echo "</form>";
                    }
               
                ?>
            
            </table>
        
            
    </div>
</body>

</html>