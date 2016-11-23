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

    <h1 class="registerhead">Conversation with <?php print $data['conv'][0]->username ?></h1>

<body style="display:none;" class="homebody">
    <div class="form-group well">
    <form method="POST" class="registerform" action="/pattywhack/mvc/public/home/addResponse" >
        <table class="table">
            <?php
            $quest = $data['conv'];
                print "<tr>";
                print "<th>From:</th> <td>" . $quest[0]->username . "</td>";
                print "</tr>";
                print "<tr>";
                print "<th>Question:</th> <td> ". $quest[0]->question ."</td>";
                print "</tr>";
            ?>
        </table>
        <br/><br/><br/><br/>
        
            <?php
                //var_dump($_SESSION['converse']);
                $resp = $_SESSION['converse'];
                
                for($i = 0; $i < count($resp); $i++) 
                {
                    print "<table class=table>";    
                    print "<tr>";
                    print "<th>From:</th> <td style='text-align: right;'>" . $resp[$i]->username . "</td>";
                    print "</tr>";
                    print "<tr>";
                    print "<th>Response:</th> <td style='text-align: right;'> ". $resp[$i]->answer ."</td>";
                    print "</tr>";
                    print "</table><br/>";
                    
                }
                print "<input type=hidden name=questID value=" . $quest[0]->question_id . ">";
            ?>
            
        <br/><br/>
                

            <label for="newMessage" style="color:black;">Response: </label>
            <textarea class="form-control" name="newMessage" placeholder="Type your message here!"></textarea><br/>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
        </div>
    
        
        
    
</body>

</html>