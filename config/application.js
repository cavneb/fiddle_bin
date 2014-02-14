//= require jquery
//= require environment
//= require ember-appkit
//= require_self
//= require_tree ./adapters
//= require_tree ./serializers
//= require router
//= require_tree ../ember
//= require_tree ./initializers

window.App = require('app').default.create({
  rootElement: '#ember-app'
});
