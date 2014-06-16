// Generated by CoffeeScript 1.7.1
describe("Animated", function() {
  var animated;
  animated = {};
  beforeEach(function() {
    animated = new Animated();
    animated.init();
  });
  afterEach(function() {
    $("#animated-styles").remove();
  });
  it("should add a style tag to the head tag", function() {
    expect($("#animated-styles")).toBeInDOM();
    expect($("#animated-styles")).toEqual("style");
  });
  it("should find all elements with the data animated property", function() {
    var elCount;
    elCount = animated.getElements().length;
    expect(elCount).toEqual(4);
  });
  it("should set the list of found elements to a property on init", function() {
    expect(animated.elements.length).toEqual(4);
  });
  it("should return true on canAnimate when all data tags are present", function() {
    expect(animated.canAnimate(animated.elements.eq(0))).toBe(true);
  });
  it("should return false on canAnimate when data tags are missing", function() {
    expect(animated.canAnimate(animated.elements.eq(1))).toBe(false);
  });
  it("should return false on canAnimate when the from data tag is missing", function() {
    expect(animated.canAnimate($('.invalid-missing-from'))).toBe(false);
  });
  it("should return false on canAnimate when the to data tag is missing", function() {
    expect(animated.canAnimate($('.invalid-missing-to'))).toBe(false);
  });
  it("should return false on canAnimate when all the required data tags are missing", function() {
    expect(animated.canAnimate($('.invalid'))).toBe(false);
  });
  it("should write keyframe tags for valid elements", function() {
    expect($("#animated-styles")).toContainText("@keyframes opacity { from { 0; } to { 1; } }");
  });
});
