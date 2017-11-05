class @Datepicker
  constructor: (options = {}) ->
    {
    } = options

    @bindEvents()
  bindEvents: =>
    $('.datepicker').pickadate(@bindParams());

  bindParams: =>
    params = {
      selectMonths: true,
      selectYears: 15,
      today: 'Today',
      clear: 'Clear',
      close: 'Ok',
      closeOnSelect: false,
    }

    if $('html').attr('lang') == 'fr'
      $.extend(params, {
        labelMonthNext: 'Mois suivant',
        labelMonthPrev: 'Mois précédent',
        labelMonthSelect: 'Selectionner le mois',
        labelYearSelect: 'Selectionner une année',
        monthsFull: [ 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre' ],
        monthsShort: [ 'Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aou', 'Sep', 'Oct', 'Nov', 'Dec' ],
        weekdaysFull: [ 'Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi' ],
        weekdaysShort: [ 'Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam' ],
        weekdaysLetter: [ 'D', 'L', 'M', 'M', 'J', 'V', 'S' ],
        today: 'Aujourd\'hui',
        clear: 'Réinitialiser',
        close: 'Fermer',
        format: 'dd/mm/yyyy',
        firstDay: 1,
        }
      )
    return params

class @BirthDatepicker extends @Datepicker
  bindParams: ->
    params = {
      max: new Date(),
      min: new Date(1900,1,1),
      selectYears: 100
    }

    return $.extend(super, params)
