
var
  React $ require :react
  Immutable $ require :immutable
  shortid $ require :shortid

var
  Noti $ React.createFactory $ require :./notifications
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    {} $ :notifications $ Immutable.fromJS $ []
      {}
        :id (shortid.generate)
        :text ":This is a glad message from server :)"
        :type :glad
      {}
        :id (shortid.generate)
        :text ":Action successed"
        :type :fine
      {}
        :id (shortid.generate)
        :text ":This is an important message from server and is very long :("
        :type :fail
      {}
        :id (shortid.generate)
        :text ":中文的消息, 也是提示"
        :type :info

  :onClick $ \ (id)
    this.setState $ {} $ :notifications $ this.state.notifications.filter $ \ (noti)
      isnt (noti.get :id) id

  :onAdd $ \ ()
    this.setState $ {} $ :notifications $ this.state.notifications.push
      Immutable.fromJS $ {}
        :id (shortid.generate)
        :text ":generate new message"
        :type :info

  :render $ \ ()
    div ({} (:className :app-page))
      , ":Just look at the messages >_>"
      div ({} (:className :line))
        div ({} (:className ":button is-attract") (:onClick this.onAdd)) :More
      Noti $ {}
        :notifications this.state.notifications
        :onClick this.onClick
        :height 60
        :magin 20
