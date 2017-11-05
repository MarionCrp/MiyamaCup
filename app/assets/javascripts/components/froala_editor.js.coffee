class @FroalaEditor
  constructor: (options = {}) ->
    {
    } = options

    @bindEvents()

  bindEvents: ->
    $('[data-is="froala-editor"]').froalaEditor({
      heightMin: 200
      })
