class @FlashMessage
  constructor: (options = {}) ->
    {
      flash_info = $("[data-is-flash-message-info]")
      @flash_type = flash_info.attr("data-is-type")
      @flash_message = flash_info.attr("data-is-message")
    } = options

    @bindEvents()

  bindEvents: ->
    if @flash_type != "" && @flash_message != ""
      Materialize.toast(@flash_message, 4000, @flash_type)
