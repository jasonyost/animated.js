Animated = ->
Animated::init = ->
  animated = this

  # Add style tag to page
  $("head").append "<style id=\"animated-styles\"></style>"

  #Collect all the elements!
  @elements = @getElements()

  #Add the keyframes!
  i = 0
  while i < @elements.length
    el = @elements.eq(i)
    if animated.canAnimate(el)
      animated.addKeyFrames el
      animated.addStyles el
    i++
  return

Animated::getElements = ->
  elements = $("*[data-animated-property]")
  elements

Animated::addKeyFrames = (element) ->
  property = element.data("animated-property")
  from = element.data("animated-from")
  to = element.data("animated-to")
  $("#animated-styles").append "@keyframes " + property + "-animation { from { " + from + "; } to { " + to + "; } }"
  return

Animated::canAnimate = (elementToTest) ->
  return false  if elementToTest.data("animated-property") is `undefined`
  return false  if elementToTest.data("animated-from") is `undefined`
  return false  if elementToTest.data("animated-to") is `undefined`
  true

Animated::addStyles = (element) ->
  selector = '#' + element.prop("id");
  animID = element.prop("id") + "-animation"
  property = element.data("animated-property")
  from = element.data("animated-from")
  css = []
  css.push selector + ' { '
  css.push '-webkit-animation: ' + animID + ' 1s linear 1s 1 forward;'
  css.push '-moz-animation: ' + animID + ' 1s linear 1s 1 forward;'
  css.push '-o-animation: ' + animID + ' 1s linear 1s 1 forward;'
  css.push 'animation: ' + animID + ' 1s linear 1s 1 forward;'
  css.push property + ':' + from + ';'
  css.push '}'
  cssString = css.join '\r\n'
  $("#animated-styles").append(cssString)
