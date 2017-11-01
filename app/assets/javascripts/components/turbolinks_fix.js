document.addEventListener("turbolinks:load", () => {
  document.body.addEventListener("ajax:error", (e) => {
    debugger
    if (e.detail[2].status !== 422) {
      return
    }
    document.body = e.detail[0].body
    Turbolinks.dispatch("turbolinks:load")
    scrollTo(0, 0)
  })
})
