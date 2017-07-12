<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Appl Info    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

</head>
<body>


BootStrap Index

<div class="alert alert-success">
    <strong>Success!</strong> Indicates a successful or positive action.
</div>



<p id="firstpara">First Para</p>


<table class="table table-bordered">
    <thead>
    <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span>John</span></td>
        <td><span>Doe</span></td>
        <td><span>john@example.com</span></td>
    </tr>
    </tbody>
</table>
</body>

<script>
    $(document).ready(function() {
        $("span").click(function() {
            var label=$(this);
            //Add a TextBox next to the Label.
            label.after('<input type="text" style="background-color:sandybrown" name="inputtest">');

            var textbox=$(this).next();

            textbox.val(label.html());

            label.hide()
            textbox.focus();
            textbox.focusout(function() {
                $(this).hide();
                $(this).prev().html($(this).val());
                $(this).prev().show();
            })
        });

        $("#firstpara").click(function() {
            var label=$(this);
            //Add a TextBox next to the Label.
            label.after('<input type="text" style="background-color:sandybrown" name="inputtest">');

            var textbox=$(this).next();

            textbox.val(label.html());

            label.hide()
            textbox.focus();
            textbox.focusout(function() {
                $(this).hide();
                $(this).prev().html($(this).val());
                $(this).prev().show();
            })

            })
    });
</script>
</html>

