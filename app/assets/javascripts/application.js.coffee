#= require rails-ujs
#= require turbolinks
#= require jquery
#= require jquery_ujs
#= require materialize-sprockets
#= require ./components/datepicker
#= require ./components/materialize_select
#= require ./components/froala_editor
#= require ./components/flash_message
#= require ./fix/turbolinks_fix.js
#= require ./fix/materialize_form_errors_fix.js

# Froala WYSIWYG
#= require froala_editor.min.js
#= require plugins/colors.min.js
#= require plugins/fullscreen.min.js
#= require plugins/quick_insert.min.js
#= require plugins/code_beautifier.min.js
#= require plugins/code_view.min.js

$(document).on('turbolinks:load', ->
  new FroalaEditor
  new MaterializeSelect
  new FlashMessage
)
