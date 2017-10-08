class @Datepicker
  constructor: (options = {}) ->
    {
    } = options

    @bindEvents()

  bindEvents: ->
    $('.datepicker').pickadate({
      selectMonths: true,
      selectYears: 15,
      today: 'Today',
      clear: 'Clear',
      close: 'Ok',
      closeOnSelect: false
    });
