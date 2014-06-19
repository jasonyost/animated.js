describe "Animated", ->
  animated = {}
  beforeEach ->
    animated = new Animated()
    jasmine.getFixtures().fixturesPath = 'test/jasmine/spec/javascripts/fixtures'
    return

  afterEach ->
    $("#animated-styles").remove()
    return

  it "should add a style tag to the head tag", ->
    expect($("#animated-styles")).toBeInDOM()
    expect($("#animated-styles")).toEqual "style"
    return

  it "should find all elements with the data animated property", ->
    elCount = animated.getElements().length
    expect(elCount).toEqual 4
    return

  it "should set the list of found elements to a property on init", ->
    expect(animated.elements.length).toEqual 4
    return

  it "should return true on canAnimate when all data tags are present", ->
    loadFixtures "test.html"
    expect(animated.canAnimate($('.valid'))).toBe true
    return

  it "should return false on canAnimate when data tags are missing", ->
    loadFixtures "test.html"
    expect(animated.canAnimate($('.invalid-missing-tags'))).toBe false
    expect(animated.canAnimate($('.invalid-missing-from'))).toBe false
    expect(animated.canAnimate($('.invalid-missing-to'))).toBe false
    expect(animated.canAnimate($('.invalid'))).toBe false
    return

  it "should write keyframe tags for valid elements", ->
    expect($("#animated-styles")).toContainText "@keyframes opacity-animation { from { opacity:0; } to { opacity:1; } }"
    expect($("#animated-styles")).toContainText "@-webkit-keyframes opacity-animation { from { opacity:0; } to { opacity:1; } }"
    return

  it "should write CSS for the keyframes in the animated-styles tag", ->
    #check that it added a selector
    expect($('#animated-styles')).toContainText "#opacity"
    expect($('#animated-styles')).toContainText "-webkit-animation:"
    expect($('#animated-styles')).toContainText "-moz-animation:"
    expect($('#animated-styles')).toContainText "-o-animation:"
    expect($('#animated-styles')).toContainText "animation:"
    expect($('#opacity').css('opacity')).toEqual('1');
    return

  return
