// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .
var when_page_is_ready = function(){

  $("p.alert").fadeOut(2000)
  $("p.notice").fadeOut(2000)


  // $("div.commentsheader").click(function() {
  //   $("div.commentslist").slideUp('slow');

  // })
  $("div.commentslist").hide();
  if (annyang) {
    var commands = {
        'Show Comments': function() {
          $("div.commentslist").slideDown('slow');
        }
    };
    annyang.addCommands(commands);
    annyang.start(); 
  }

  if (annyang) {
    var commands = {
        'Hide Comments': function() {
          $("div.commentslist").slideUp('slow');
        }
    };
    annyang.addCommands(commands);
    // annyang.start(); 
  }

 


 
}


// if (annyang) {
//     var commands = {
//         'Kevin': function() {
//             alert('I implemented this after drinking two bottles of champagne!');
//         }
//     };
//     annyang.addCommands(commands);
//     annyang.start(); 
// }

 

$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);