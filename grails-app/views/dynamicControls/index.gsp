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

<div id="mainid" ng-app="dynaApp" ng-controller="dynaCtrl">

    <button id="button1" ng-click="dynaAdd($event)">Add</button>

</div>


</body>

<script>
    var jq = $.noConflict();

   var app =  angular.module('dynaApp', [])

    app.controller('dynaCtrl', ['$scope','$http', '$element', '$compile', function ($scope, $http, $element, $compile) {

        $scope.dynaAdd = function(item) {
           // alert(item.target.attributes.id.value)
            var clickedid = item.target.attributes.id.value

          //  jq('#'+clickedid).after('<input type="text" ng-click="newFunction($event)"/>');

           // var el = $compile('<input type="text" ng-click="newFunction($event)"/>')($scope);
           // $element.parent().append(el);

            //$compile($.getElementById("mainid"));
           // $compile(element.contents())(scope);

            var el = angular.element('<input type="text" ng-model="text2" ng-click="newFunction()" name="text">');
            $(item.currentTarget).empty();
            $(item.currentTarget).append(el);

            $compile(el)($scope);
           // angular.compile(el)
           // angular.link($scope,el);

        }

        $scope.newFunction = function() {
            alert ('newFunction called');
        }


    }]);
</script>
</html>