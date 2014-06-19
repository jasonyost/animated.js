describe("Animated",function(){var t;t={},beforeEach(function(){t=new Animated,jasmine.getFixtures().fixturesPath="test/jasmine/spec/javascripts/fixtures"}),afterEach(function(){$("#animated-styles").remove()}),it("should add a style tag to the head tag",function(){expect($("#animated-styles")).toBeInDOM(),expect($("#animated-styles")).toEqual("style")}),it("should find all elements with the data animated property",function(){var e;e=t.getElements().length,expect(e).toEqual(4)}),it("should set the list of found elements to a property on init",function(){expect(t.elements.length).toEqual(4)}),it("should return true on canAnimate when all data tags are present",function(){loadFixtures("test.html"),expect(t.canAnimate($(".valid"))).toBe(!0)}),it("should return false on canAnimate when data tags are missing",function(){loadFixtures("test.html"),expect(t.canAnimate($(".invalid-missing-tags"))).toBe(!1),expect(t.canAnimate($(".invalid-missing-from"))).toBe(!1),expect(t.canAnimate($(".invalid-missing-to"))).toBe(!1),expect(t.canAnimate($(".invalid"))).toBe(!1)}),it("should write keyframe tags for valid elements",function(){expect($("#animated-styles")).toContainText("@keyframes opacity-animation { from { opacity:0; } to { opacity:1; } }"),expect($("#animated-styles")).toContainText("@-webkit-keyframes opacity-animation { from { opacity:0; } to { opacity:1; } }")}),it("should write CSS for the keyframes in the animated-styles tag",function(){expect($("#animated-styles")).toContainText("#opacity"),expect($("#animated-styles")).toContainText("-webkit-animation:"),expect($("#animated-styles")).toContainText("-moz-animation:"),expect($("#animated-styles")).toContainText("-o-animation:"),expect($("#animated-styles")).toContainText("animation:"),expect($("#opacity").css("opacity")).toEqual("1")})});