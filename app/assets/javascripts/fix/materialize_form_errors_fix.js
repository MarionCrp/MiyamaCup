document.addEventListener("turbolinks:load", function () {
  document.body.addEventListener("ajax:error", function (e) {
    $('.field_with_errors, .datepicker').siblings('label').addClass('active')
  });
});
