<?php  
     require_once '../app/controllers/home.php';
     $control = new home();
?>

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
    
    <style>
        body 
        {
            padding-bottom: 80px;    
        }
        .editAccount{
            margin-left: 60px;
            margin-right: 60px;
        }
        
        .modhead {
            color: white;
        }
        
        ul.items {
          text-align: center;
          list-style-type: none;
            align-content: center;
            
        }
        ul.items li {
          float:left;
            padding: 40px;
            padding-left: 60px;
        }
        ul.items li:nth-child(8n+9) {
          clear:left;
          float:left;
        }
    </style>

<head>
    <title>Patty Whack</title>
</head>
    <?php include("../public/includes/navbar.php"); ?>
      <?php include("includes/footer.php"); ?>
    <h1 class="registerhead"></h1>

<body style="display:none;" class="homebody">
    <?php 
    if(isset($data['message'])) { 
        echo "<div class='alert alert-danger' style='margin-top: 4%; font-size: 2em;'>$data[message]</div>";
     }?>
    
    <form class="editAccount">
        <h2 class="modhead">Your Orders</h2>
        <div class="form-group well">
                <?php 
                    
                    $orders = $this->model('orders');
                    $userOrders = $orders->where('username', $_SESSION['user'])->get();
                    //var_dump($userOrders);
                
                    if($userOrders->count() === 0)
                        echo "<h3 style='text-align: center;'>Sure is empty over here... Try placing an order!</h3>";
                    else {
                        echo "<table class='table table-striped'>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Order Status</th>
                                    <th>Tracking Number</th>
                                    <th style='width: 23px;'>Contents of Order</th>
                                    <th style='width: 23px;'>Cancel Order?</th>
                                </tr>";
                        $status = $this->model('status')->get();
                        
                        for ($k = 0; $k < $userOrders->count(); $k++)
                        {
                            $id = $userOrders->get($k)->status_id;
                            $statusName = $status->where('status_id', $id)->first()->status_name;
                            if($id == 2 || $id == 8 || $id == 9){
                                echo "<tr>";
                                echo "<td>" . $userOrders->get($k)->order_id . "</td>";
                                echo "<td>" . $statusName . "</td>";
                                echo "<td>" . $userOrders->get($k)->tracking_number . "</td>";
                                if ($id == 2)
                                    echo "<td><a href=../home/viewOrder/" . $userOrders->get($k)->order_id . "><span class='glyphicon glyphicon-eye-open'/> </td>";
                                else
                                    echo "<td> </td>";

                                
                                if($id == 9)
                                    echo "<td><a href=../home/deleteOrder/" . $userOrders->get($k)->order_id . "/2><span class='glyphicon glyphicon-remove'/> </a></td>"; 
                                else
                                    echo "<td> </td>";
                                echo "</tr>";
                        }
                        }
                        echo "</table>";
                    }
                ?>
        </div>
    
    </form>
    
    <form method="POST" class="editAccount" action="../home/editUser" >
        <h2 class="modhead">Modify Account Details</h2>
        <div class="form-group well">
            <label for="emailbxx">Email: </label>
            <input type="text" disabled required class="form-control" name="emailbxx" value="<?php echo $_SESSION['email'];?>"/>
            
            <label for="userNBox">Username: </label>
            <input type="text" disabled required class="form-control" name="userNBox" value="<?php echo $_SESSION['user'];?>"/>            
            
            <label for="oldPassBox">Current Password*: </label>
            <input type="password" required class="form-control" name="oldPassBox" placeholder="Current Password" />
            
            <label for="NewPassBox">New Password: </label>
            <input type="password" class="form-control" name="NewPassBox" placeholder="New Password"  pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}"/>
            
            <label for="conNewPassBox">Confirm New Password: </label>
            <input type="password" class="form-control" name="conNewPassBox" placeholder="Confirm New Password" pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}" />
            
            <label for="addrBox">New Address: </label>
            <input type="text" class="form-control" name="addrBox" placeholder="New Address" value="<?php  if(isset($data['addressBox'])){echo $data['addressBox'];}?>" />
            
            <label for="postalBox">New Postal Code: </label>
            <input type="text" class="form-control" name="postalBox" placeholder="New Postal Code" value="<?php  if(isset($data['postalCodeBox'])){echo $data['postalCodeBox'];}?>" />
        </div>
        
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
    
    
    <form method="POST" class="editaccount" action="../home/updatePreference">
        <h2 class="modhead">Change your Prefences</h2>
        <div class="form-group well container-fluid"s>
            <ul class="items">
                <?php 
                $control->listAllPref();

                ?>
            </ul>
            
            
        </div>
        <button type="submit" class="btn btn-default">Update Preferences</button>
    </form>
    
    
        <h2 style="color:white;" class="editaccount">Your Questions to the Admins </h2>    
        <div class="well editaccount">
        <table class="table">
            <tr>
            <th>Id</th><th>Question</th><th>Status</th><th>View Question</th>
            </tr> 
            
            <?php 
            //error_reporting(0);
            $getQuestions = $this->model('question')->where('username', $_SESSION['user'])->get();
            //var_dump($getQuestions->get());
            //$getQuestions->where('username', $_SESSION['user']);
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
                echo $questions->question;
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


      
</body>

</html>