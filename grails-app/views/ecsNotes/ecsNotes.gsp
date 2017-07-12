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


<div ng-app="ecsNotes" ng-controller="ecsNotesCtrl" ng>

    <div class="alert alert-success">
        <strong>Success!</strong> Indicates a successful or positive action.
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <div class="col-sm-3">Standard Budget</div>
                <div class="col-sm-9"><input type="text" value="100"><input type="text" ng-value="100" ng-model="stdBudget" ng-blur="totalBudget()"></div>
            </div>
            <div class="row">
                <div class="col-sm-3">Travel Budget</div>
                <div class="col-sm-9"><input type="text" ng-model="travelBudget" -="" ng-blur="totalBudget()"></div>
            </div>
            <div class="row">
                <div class="col-sm-3">Total</div>
                <div class="col-sm-9">{{calcvalues.totalBudget}}</div>

            </div>
        </div>


        <div class="col-lg-4" >
            <h2>NOTES</h2>
            <textarea ng-model="ecsnote" ng-blur="saveNote()"></textarea>
            <div id="notesid">
            <ul  class="list-group">
                <li ng-repeat="note in notes" class="list-group-item">{{note.NOTE}}{{note.HUID}}</li>
            </ul>

            </div>
        </div>
    </div>
</div>
</body>

<script>
    $(document).ready(function() {
        $("ul").on("click","li",function() {

            //alert('span click')
            var label = $(this);
            //Add a TextBox next to the Label.
            label.after('<input type="text" style="background-color:bisque"  name="inputtest">');

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
    });
</script>

</html>

