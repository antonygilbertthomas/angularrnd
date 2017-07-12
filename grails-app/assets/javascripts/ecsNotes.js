var app = angular.module('ecsNotes', []);

app.controller('ecsNotesCtrl', ['$scope','$http', function ($scope, $http) {
    $scope.notes = []

    $scope.queryNotes = function () {
        var data = $.param({
            applicationname: $scope.applicationname,
        });

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }

        $http.post("/ecsNotes/query", data, config)
            .success(function (data, status, headers, config) {

                $scope.notes = data;
            })
            .error(function (data, status, headers, config) {
                $scope.myWelcome = 'Failure'
            });
    }

    $scope.saveNote = function () {
        var data = $.param({ecsnote: $scope.ecsnote})

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("/ecsNotes/add", data, config)
            .success(function (data, status, headers, config) {

                //  $scope.notes = data;
                //  $scope.statusmessage = data;
                $scope.queryNotes();
            })
            .error(function (data, status, headers, config) {
                $scope.myWelcome = 'Failure'
            });
    }

    $scope.calcvalues = []
    $scope.totalBudget = function () {

        var data1 = $.param({
            travelBudget: $scope.travelBudget,
            stdBudget: $scope.stdBudget})

        var config = {
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
            }
        }
        $http.post("/ecsNotes/totalBudget", data1, config)
            .success(function (data, status, headers, config) {

                //  $scope.notes = data;
                //  $scope.statusmessage = data;
                //$scope.queryNotes();
                $scope.calcvalues = data
            })
            .error(function (data, status, headers, config) {
                $scope.myWelcome = 'Failure'
            });
    }
}]);



