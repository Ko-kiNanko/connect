window.app = angular.module('Board'),
['ngResource']

App.config($httpProvider) ->
  $httpProvider.defaults.header.common['X-CSRF-Token'] =
    document.getElementsByName("csrf-token")[0].content