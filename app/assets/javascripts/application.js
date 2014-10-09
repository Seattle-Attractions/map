// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require underscore
//= require gmaps/google

$(function(){ $(document).foundation(); });

function initClickBind(handler, $attr, marker) {
  $attr.on('click', function() {
    handler.getMap().setZoom(14);;
    console.log(marker);
    marker.setMap(handler.getMap());
    marker.panTo();
    google.maps.event.trigger(marker.getServiceObject(), 'click');
  });
};

function bindAttrMarkerPairs(handler, markers) {
  for (i = 0; i < $('.attraction').length; i++) {
    var $attr = $('div#attraction_' + i);
    initClickBind(handler, $attr, markers[i]);
  };
};
