// Generated by CoffeeScript 1.7.1
(function() {
  require.config({
    urlArgs: "nocache=" + (new Date).getTime(),
    paths: {
      "jquery": "../vendor/jquery.min",
      "underscore": "../vendor/underscore-min"
    }
  });

  require(["jquery", "underscore", "dom"], function($, _, Dom) {
    return $(document).ready(function() {
      console.log(Dom);
      return console.log(Dom.create("div").into(document.body));
    });
  });

}).call(this);
