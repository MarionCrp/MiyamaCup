#= require rails-ujs
#= require turbolinks
#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require ./components/datepicker
#= require ./components/flash_message

$ =>
  new Datepicker
  new FlashMessage
