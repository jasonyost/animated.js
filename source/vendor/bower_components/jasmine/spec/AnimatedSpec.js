describe("Animated", function(){

  beforeEach(function() {
    animated = new Animated()
    animated.init();
  });

  afterEach(function() {
    $('#animated-styles').remove();
  });

  it("should add a style tag to the head tag", function(){
      expect($('#animated-styles')).toBeInDOM();
      expect($('#animated-styles')).toEqual('style');
  });

  it("should find all elements with the data animated property", function(){
      // 3 elements with the data-animated attribute have been added to the SpecRunner
      var elCount = animated.getElements().length;
      expect(elCount).toEqual(3);
  });

  it("should set the list of found elements to a property on init", function(){
      expect(animated.elements.length).toEqual(3);
  })

  it("should return true on canAnimate when all data tags are present", function(){
      expect(animated.canAnimate(animated.elements.eq(0))).toBe(true);
  });

  it("should return false on canAnimate when data tags are missing", function(){
    expect(animated.canAnimate(animated.elements.eq(1))).toBe(false);
  });

  it("should write keyframe tags for valid elements", function(){
    expect($('#animated-styles')).toContainText('@keyframes opacity { from { 0; } to { 1; } }');
  });

});
