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
//= require jquery.ui.all
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $(document).foundation();
});

$(function() {
	$('#accordion')
	  .accordion({
			heightStyle: 'content',
			collapsible: true,
			header: '> div > h3'
	})
	  .sortable ({
	  	axis: 'y',
	  	handle: 'h3',
	  	stop: function(event, ui) {
	  		ui.item.children('h3').triggerHandler('focusout');
	  	}
	  });
});