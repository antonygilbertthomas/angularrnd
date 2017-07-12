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
<div ng-app="applInfo" ng-controller="applInfoCtrl">
    <form>
        Application Name : <input type="text" ng-model="applicationname" ng-blur="applInfoQuery()">
        {{rowcnt}}
        <table>
        <thead>
            <tr>
                <td WIDTH="25%">Application Name</td>
                <td width="15%">Login Type</td>
                <td width="25%">Base URL</td>
                <td>Local Auth App Name</td>
            </tr>
        </thead>
        <tbody>
<!--        <tr ng-repeat="appl in applications"> -->

        <tr >
                <td>{{appl.APPLICATIONNAME}}</td>
                <td><span id="{{appl.APPLICATIONNAME}}" editable="true" ng-click="editLoginType($event)">{{appl.LOGINTYPE}}</span></td>
                <td>{{appl.BASEURL}}</td>
                <td>{{appl.LOCALAUTHAPPNAME}}</td>
            </tr>
        </tbody>
        </table>

        <button ng-click="prevApp()" name="Previous">Previous</button>
        <button ng-click="nextApp()" name="Next">Next</button>
    </form>
</div>



</body>
<script>
  /*  $(document).ready(function() {

        $("table").on("click","span",function() {

            var label = $(this);
            //Add a TextBox next to the Label.

            var labelid = label.attr('id')
            label.after('<input type="text" style="background-color:bisque"  ng-blur="saveLoginType('+labelid+')">');

        //    alert (label.attr('id'));


            var textbox = $(this).next();

            textbox.val(label.html());

            label.hide()
            textbox.focus();
            textbox.focusout(function () {
                $(this).hide();
                $(this).prev().html($(this).val());
                $(this).prev().show();
            })
        });
    }); */
</script>
</html>

