// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
 //= require readmore
//= require_tree.

/* --------------------------------------------------
   Hide Flash Messages
-------------------------------------------------- */

$(document).on('ready page:load', function () {
  $("#flash_messages").delay(600).fadeOut(600);
});

/* --------------------------------------------------
   User Profile Popup
-------------------------------------------------- */

$(document).on('ready page:load', function () {
    $(".login-section").click(function(e) {
        $(".user-logout").toggle();
        e.stopPropagation();
    });

    $(document).click(function(e) {
        if (!$(e.target).is('.user-logout, .user-logout*')) {
            $(".user-logout").hide();
        }
    });
});

/* --------------------------------------------------
   Readmore
-------------------------------------------------- */
$(document).on('ready page:load', function () {

  $('article .post-text').readmore({
    speed: 75,
    embedCSS: false,
    collapsedHeight: 200,
    lessLink: '<a href="#" class="post-read-link">Read Less</a>',
    moreLink: '<a href="#" class="post-read-link">Read More</a>'
  });

});
