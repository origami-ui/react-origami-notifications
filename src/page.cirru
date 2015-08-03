
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

  :render $ \ ()
    div ({} (:className :app-page))
      , ":Just look at the messages >_>"
      Noti $ {}
        :notifications this.state.notifications
        :onClick this.onClick
        :height 80
        :magin 20
