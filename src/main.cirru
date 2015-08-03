
var
  React $ require :react

require :origami-ui

var
  Page $ React.createFactory $ require :./page

React.render (Page) document.body
