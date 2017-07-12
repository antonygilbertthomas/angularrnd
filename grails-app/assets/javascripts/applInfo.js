var app = angular.module('applInfo', []);

app.controller('applInfoCtrl', ['$scope','$http','$compile', function ($scope, $http, $compile) {
    $scope.applications = []

    var appcntr = 1;

    $scope.applInfoQuery = function() {
        var data = $.param({
            applicationname: $scope.applicationname,
        });

        var config = {
            headers : {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }

        $http.post("/ApplInfo/query", data, config)
            .success(function (data, status, headers, config) {

                $scope.applications = data;
                appcntr = 0;

                $scope.appl = $scope.applications[appcntr];
            })
            .error(function (data, status, headers, config) {
                $scope.myWelcome = 'Failure'
            });
    }

    $scope.nextApp = function() {
       // if (applications[appcntr++]) {
            $scope.appl = $scope.applications[++appcntr];
       // }
    }
    $scope.prevApp = function() {
        // if (applications[appcntr++]) {
        $scope.appl = $scope.applications[--appcntr];
        // }
    }

    $scope.editLoginType = function(event) {
        //  jq('#'+clickedid).after('<input type="text" ng-click="newFunction($event)"/>');

        var clickedid = event.target.attributes.id.value;
        var el = angular.element('<input id="newTxt" type="text" ng-model="logintype" ng-blur="saveLoginType( \''+clickedid+'\')">');

        // Set the value of text field to the static text
        $scope.logintype = event.target.textContent;

        // Add new text input after current element
        $(event.currentTarget).after(el);
        $('#newTxt').focus();

        // Set the value of static text to blank
        event.target.textContent = '';

        $scope.saveLoginType = function(appName) {

            var data = $.param({logintype: $scope.logintype,applicationname : appName})

            var config = {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
                }
            }
            $http.post("/applInfo/updateType", data, config)
                .success(function (data, status, headers, config) {

                    //  $scope.notes = data;
                    //  $scope.statusmessage = data;
                    //$scope.queryNotes();
                    event.target.textContent= $scope.logintype;
                    el.remove();
                })
                .error(function (data, status, headers, config) {
                  //  $scope.myWelcome = 'Failure'
                });


            //alert (prevEvent);
            //alert (prevEvent.target.attributes.id.value);
            //alert ($(prevEvent.currentTarget).html());
          //  $(prevEvent.target).show();
          //  $(event.currentTarget).show();

           // alert ("SAVE"+id);
        }
        $compile(el)($scope);
    }
}]);