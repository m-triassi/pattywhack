<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 


<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
         <a class="navbar-brand" href="/pattywhack/mvc/public/home/index"><img alt="Brand" src="/pattywhack/mvc/public/img/pattyLogo.ico" style="height: 20px; width: 20px;"></a>
        <a class="navbar-brand" href="/pattywhack/mvc/public/home/index">PattyWhack</a>
        <ul class="nav navbar-nav">
            <li><a href="/pattywhack/mvc/public/home/index">Home</a></li>
            <li><a href="/pattywhack/mvc/public/home/placeOrder">Place Order</a></li>
            <li><a href="/pattywhack/mvc/public/home/request">Request a Product</a></li>
        </ul>
           <!-- <input type="button" value="Login" class="btn btn-success btn-sm" style="float: right; font-size: 15px;" /> -->
        
        <ul class="nav navbar-nav" style="float: right;">    
            <?php 
            require_once '../app/controllers/home.php';
            $control = new home();
                if(isset($_SESSION['user'])) {
                    echo "Welcome " . $_SESSION['user'];
                    echo '<li><a href="/pattywhack/mvc/public/home/logOut"  style="float: right; font-size: 15px;">Logout</a></li>';
                    echo '<li><a href="/pattywhack/mvc/public/home/userAccount"  style="float: right; font-size: 15px;">My Account</a></li>';
                    
                    if($control->checkAuth()){
                        echo '<li><a href="/pattywhack/mvc/public/home/adminPanel"  style="float: right; font-size: 15px;">Admin Panel</a></li>';
                    }
                    
                }
                else {
                    echo '<li><a href="/pattywhack/mvc/public/home/register" style="float: right; font-size: 15px;">Register</a></li>
                    <li><a href="/pattywhack/mvc/public/home/login" style="float: right; font-size: 15px;">Login</a></li>';
                }
                
            ?>
        </ul>
    </div>
</nav>