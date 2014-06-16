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
    animated.addKeyFrames el  if animated.canAnimate(el)
    i++
  return

Animated::getElements = ->
  elements = $("*[data-animated-property]")
  elements

Animated::addKeyFrames = (element) ->
  property = element.data("animated-property")
  from = element.data("animated-from")
  to = element.data("animated-to")
  $("#animated-styles").append "@keyframes " + property + " { from { " + from + "; } to { " + to + "; } }"
  return

Animated::canAnimate = (elementToTest) ->
  return false  if elementToTest.data("animated-property") is undefined
  return false  if elementToTest.data("animated-from") is undefined
  return false  if elementToTest.data("animated-to") is undefined
  true
