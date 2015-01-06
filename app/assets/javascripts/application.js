// DO NOT TOUCH JQUERY.TURBOLINKS. Turbolinks will break and the app will
// burn down, IN THAT ORDER.

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require foundation
//= require_tree .
//= require underscore
//= require gmaps/google

$(function(){ $(document).foundation(); });

function initClickBind(handler, $attr, marker) {
  $attr.on('click', function() {
    $('div.attraction').removeClass('selected');
    $attr.addClass('selected');
    handler.getMap().setZoom(14);;
    marker.setMap(handler.getMap());
    marker.panTo();
    google.maps.event.trigger(marker.getServiceObject(), 'click');
  });
  // marker.on('click', function() {
  //   $attr.parent().scrollTo($attr);
  //   $attr.click();
  // });
};

function bindAttrMarkerPairs(handler, markers) {
  for (i = 0; i < $('.attraction').length; i++) {
    var $attr = $('div#attraction_' + i);
    initClickBind(handler, $attr, markers[i]);
  };
};
