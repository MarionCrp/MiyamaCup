#= require rails-ujs
#= require turbolinks
#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require ./components/datepicker
#= require ./components/materialize_select
#= require ./components/flash_message
#= require ./fix/turbolinks_fix.js
#= require ./fix/materialize_form_errors_fix.js

$ ->
  new Datepicker
  new MaterializeSelect
  new FlashMessage
