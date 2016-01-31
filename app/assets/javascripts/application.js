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
//= require posts
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

  $('article .post-text-content').readmore({
    speed: 75,
    embedCSS: false,
    collapsedHeight: 150,
    lessLink: '<a href="#" class="post-read-link">Read Less</a>',
    moreLink: '<a href="#" class="post-read-link">Read More</a>'
  });

});

/* --------------------------------------------------
   Post Form Medium Editor
-------------------------------------------------- */
$(document).on('ready page:load', function () {
  var editor = new MediumEditor('.post-text-area textarea', {
        placeholder: {
        /* This example includes the default options for placeholder,
           if nothing is passed this is what it used */
        text: 'Write your story here ...',
    },
        toolbar: {
        /* These are the default options for the toolbar,
           if nothing is passed this is what is used */
        allowMultiParagraphSelection: true,
        buttons: ['bold', 'italic', 'underline', 'anchor', 'h3', 'h4', 'quote'],
        diffLeft: 0,
        diffTop: -10,
        firstButtonClass: 'medium-editor-button-first',
        lastButtonClass: 'medium-editor-button-last',
        standardizeSelectionStart: false,
        static: false,
        relativeContainer: null,
        /* options which only apply when static is true */
        align: 'center',
        sticky: false,
        updateOnEmptySelection: false
    }
  });
});

/* --------------------------------------------------
   Infinite Scroll
-------------------------------------------------- */

$(document).on('ready page:load', function () {
  if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination .next_page').attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Please Wait...");
        return $.getScript(url);
      }
    });
    return $(window).scroll();
  }
});