// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular/angular
//= require angular-route/angular-route
//= require angular-rails-templates
//= require angular-resource/angular-resource
//= require video.js/dist/video-js/video.js
//= require videojs-youtube/dist/vjs.youtube.js
//= require bootstrap-material-design/dist/js/material.js
//= require bootstrap-material-design/dist/js/ripples.js
//= require_tree .

$(document).on('ready', function() {
  $.material.init();
});
