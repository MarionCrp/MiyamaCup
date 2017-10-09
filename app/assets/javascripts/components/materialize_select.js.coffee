class @MaterializeSelect
  constructor: (options = {}) ->
    {
    } = options

    @bindEvents()

  bindEvents: ->
    $('select').material_select()
