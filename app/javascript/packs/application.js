// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("jquery")
require("bootstrap")

$(document).on('ready turbolinks:load', function() {
  $("#thumbs-up-btn").click(function() {
    $("#thumbs-up-btn").toggleClass("green");
    $("#thumbs-down-btn").removeClass("red");
    $('#thumbs-up-checkbox').prop('value', !$('#thumbs-up-checkbox').prop('value'));
    $('#thumbs-down-checkbox').prop('value', false);
  });
  $("#thumbs-down-btn").click(function() {
    $("#thumbs-down-btn").toggleClass("red");
    $("#thumbs-up-btn").removeClass("green");
    $('#thumbs-down-checkbox').prop('value', !$('#thumbs-down-checkbox').prop('value'));
    $('#thumbs-up-checkbox').prop('value', false);
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
