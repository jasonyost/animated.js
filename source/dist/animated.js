function Animated() {

}

Animated.prototype.init = function(){
  animated = this;

  // Add style tag to page
  $('head').append('<style id="animated-styles"></style>');

  //Collect all the elements!
  this.elements = this.getElements();

  //Add the keyframes!
  for (i=0;i<this.elements.length;i++){
    var el = this.elements.eq(i);
    if(animated.canAnimate(el)){
      animated.addKeyFrames(el);
    }
  }

};

Animated.prototype.getElements = function(){
  var elements = $('*[data-animated-property]');
  return elements;
};

Animated.prototype.addKeyFrames = function(element){
  var property = element.data("animated-property");
  var from = element.data("animated-from");
  var to = element.data("animated-to");
  $('#animated-styles').append('@keyframes ' + property + ' { from { '+ from + '; } to { ' + to + '; } }')
};

Animated.prototype.canAnimate = function(elementToTest){
  if(elementToTest.data("animated-property") === undefined){
    return false;
  }
  if(elementToTest.data("animated-from") === undefined){
    return false;
  }
  if(elementToTest.data("animated-to") === undefined){
    return false;
  }
  return true;
};
