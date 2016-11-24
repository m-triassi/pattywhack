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

    <form method="POST" action="../home/" >
        
        <div class="editAccount form-group well" style="height:700px;overflow-y:auto;">
            <table class="table table-striped">
                <tr>
                    <th>Product Name</th><th>Product Price</th><th>Product Id Number</th>
                </tr>
                <?php
                $details = $this->model('order_detail')->where('order_id', $data['order_id'])->get();
                for($i = 0; $i < $details->count(); $i++)
                {
                    $currProd = $this->model('product')->where('product_id', $details->get($i)->product_id)->first();
                    echo "<tr>";
                    echo "<td>" . $currProd->product_name . "</td>";
                    echo "<td>" . $details->get($i)->item_price . "</td>";
                    echo "<td>" . $details->get($i)->product_id . "</td>";
                    echo "</tr>";
                    
                }
                    
                    ?>
            </table>
        </div>
    </form>
</body>

</html>