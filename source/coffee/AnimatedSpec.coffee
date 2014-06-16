describe "Animated", ->
  animated = {}
  beforeEach ->
    animated = new Animated()
    animated.init()
    return

  afterEach ->
    $("#animated-styles").remove()
    return

  it "should add a style tag to the head tag", ->
    expect($("#animated-styles")).toBeInDOM()
    expect($("#animated-styles")).toEqual "style"
    return

  it "should find all elements with the data animated property", ->
    # 3 elements with the data-animated attribute have been added to the SpecRunner
    elCount = animated.getElements().length
    expect(elCount).toEqual 3
    return

  it "should set the list of found elements to a property on init", ->
    expect(animated.elements.length).toEqual 3
    return

  it "should return true on canAnimate when all data tags are present", ->
    expect(animated.canAnimate(animated.elements.eq(0))).toBe true
    return

  it "should return false on canAnimate when data tags are missing", ->
    expect(animated.canAnimate(animated.elements.eq(1))).toBe false
    return

  it "should write keyframe tags for valid elements", ->
    expect($("#animated-styles")).toContainText "@keyframes opacity { from { 0; } to { 1; } }"
    return

  return
