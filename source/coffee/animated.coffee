class Animated
  constructor: ->
    $("head").append "<style id=\"animated-styles\"></style>"
    @elements = this.getElements()
    this.writeStyles()
  getElements: ->
    elements = $("*[data-animated-property]")
    elements
  canAnimate: (element) ->
    return false  if element.data("animated-property") is `undefined`
    return false  if element.data("animated-from") is `undefined`
    return false  if element.data("animated-to") is `undefined`
    return false  if element.prop("id") is `undefined`
    true
  writeStyles: ->
    i = 0
    while i < @elements.length
      el = @elements.eq(i)
      if this.canAnimate(el)
        selector = '#' + el.prop("id")
        animationName = el.prop("id") + "-animation"
        property = el.data("animated-property")
        from = el.data("animated-from")
        to = el.data("animated-to")
        $("#animated-styles").append "@keyframes " + property + "-animation { from { " + from + "; } to { " + to + "; } }"
        css = []
        css.push selector + ' { '
        css.push '-webkit-animation: ' + animationName + ' 1s linear 1s 1 forward;'
        css.push '-moz-animation: ' + animationName + ' 1s linear 1s 1 forward;'
        css.push '-o-animation: ' + animationName + ' 1s linear 1s 1 forward;'
        css.push 'animation: ' + animationName + ' 1s linear 1s 1 forward;'
        css.push property + ':' + from + ';'
        css.push '}'
        cssString = css.join '\r\n'
        $("#animated-styles").append(cssString)
      return

  @Animated = Animated
