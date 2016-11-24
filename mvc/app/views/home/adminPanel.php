<?php  
     require_once '../app/controllers/home.php';
     $control = new home();
    if(!$control->checkAuth()){
        header("Location: http://localhost/pattywhack/mvc/public/home");


} ?>
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
    
    function revealManual() {
        var manualDetails = document.getElementById("manualControl");
        manualDetails.style.display = manualDetails.style.display === 'none' ? '' : 'none';
}
  
</script>

<head>
    <title>Patty Whack</title>
    <h1 class="registerhead">Welcome Admin</h1>
</head>
    <?php include("../public/includes/navbar.php"); ?>
    <?php include("includes/footer.php"); ?>
    <h1 class="registerhead"></h1>

<body style="display:none; padding-bottom: 50px;" class="homebody">
    <div>
        <h2 style="color:white;">Add a Product</h2>
        <form method="POST" action="../home/parseLink" >

            <div class="well">
                <label for="adminProdURL">Product Link</label> <br/>
                <input type="text" class="form-control urlbox" name="adminProdURL" placeholder="Product URL" /> <br/>
                
                <div id="manualControl" style="display:none;">
                    <label for="adminProdName">Product Name</label> <br/>
                    <input type="text" class="form-control urlbox" name="adminProdName" placeholder="Product Name" /><br/>
                    
                    <label for="adminProdPrice">Product Price</label> <br/>
                    <input type="text" class="form-control urlbox" name="adminProdPrice" placeholder="Product Price" /><br/>
                    
                    <label for="adminProdURL">Product Category</label> <br/>
                    <select class="form-control" name="adminProdCategory">
                    <?php 
                        $control->getCategory();                        
                    ?> 
                    </select> <br/><br/>
                    
                </div>
                
                <button type="submit" class="btn btn-primary btn-sm">Add Item</button>
                <br/> <br/> 
                <input name="manualCheckbox" onclick="revealManual()" type="checkbox">
                <label for="manualCheckbox">Enter a Product Manually?</label>
            </div>
            <br/>
            <h2 style="color:white;">Manage Product Requests</h2>
            <div class="well" style="height:400px;overflow-y:auto;">
                <table class="table">
                <tr>
                <th>URL</th><th>Action</th>
                </tr>
                
                <?php 
                  $getURLrequest = $control->getURL();
                  for($index = 0; $index < $getURLrequest->count(); $index++){
                    $url = $getURLrequest->get($index);
                    $decodedURL = urldecode($url->url);
                        echo "<tr>";
                        echo "<td>";
                        echo "<a href='$decodedURL' target='_blank'>$decodedURL</a>";
                        echo "</td>";
                        echo "<td>";
                        echo "<a style=\"margin-right:2em;\" href=\"/pattywhack/mvc/public/home/addProduct/$url->request_id\">Insert</a>";
                        echo "<a href=\"/pattywhack/mvc/public/home/denyProduct/$url->request_id\">Deny</a>";
                        echo "</td>";                    
                        echo "</tr>";
                  }                   
                ?>
                </table>
            </div>

        </form>
        <h2 style="color:white;">Respond to Questions </h2>    
        <div class="well">
        <table class="table">
            <tr>
            <th>Id</th><th>User</th><th>Status</th><th>View Question</th>
            </tr> 
            
            <?php 
            error_reporting(0);
            $getQuestions = $control->listQuestions();
            for($i = 0; $i < $getQuestions->count(); $i++)
            {
                $questions = $getQuestions->get($i);
                if($questions->status_id == 1)
                    $status = "Pending...";
                elseif($questions->status_id == 2)
                    $status = "Answered!";
                else
                    $status = "Unknown.";
                
               
                echo "<tr>";
                echo "<td>";
                echo $questions->question_id;
                echo "</td>";
                echo "<td>";
                echo $questions->username;
                echo "</td>";
                echo "<td>";
                echo $status;
                echo "</td>";
                echo "<td>";
                echo "<a href=/pattywhack/mvc/public/home/viewConversation/$questions->question_id> View </a>";
                echo "</td>";
                echo "</tr>";
                
            }
                
            ?>
        </table>
        </div>
        
        <h2 style="color:white;">Product Database </h2>    
        <div class="well">
        <table class="table">
            <tr>
            <th>Product Name</th><th>Unit Price</th><th>Shipping Cost</th><th>URL to Product</th><th>Availability</th><th>Submit Changes</th>
            </tr> 
            
            <?php 
            /*
                $allProds $this->model('product')->get();
                for($j = 0; $j < $allProds->count(); $j++)
                {
                    echo "<tr>";
                    
                    echo "</tr>";
                }
            */
            ?>
            
              </table>
        </div>
        
    </div>
</body>

</html>
