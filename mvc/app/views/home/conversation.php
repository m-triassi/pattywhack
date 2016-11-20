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
<?php $test = $data['resp0'];
    var_dump($test); ?>
    <form method="POST" class="registerform" action="../home/" >
        <table>
            <tr>
            <th>From:</th> <td></td>
            </tr>
            <tr>
            <th>Question:</th> <td></td>
            </tr>
        </table>
        
        
        <div class="form-group well">
            <label for="">Response: </label>
            <textarea class="form-control" name="newMessage" placeholder="Type your message here!"></textarea>
        </div>
        
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</body>

</html>