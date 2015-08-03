
var
  React $ require :react/addons
  Immutable $ require :immutable
  classnames $ require :classnames

var
  Transition $ React.createFactory React.addons.CSSTransitionGroup
  div $ React.createFactory :div
  span $ React.createFactory :span

= module.exports $ React.createClass $ {}
  :displayName :origami-notifications

  :propTypes $ {}
    :notifications $ React.PropTypes.instanceOf Immutable.List
    :onClick React.PropTypes.func.isRequired
    :height React.PropTypes.number
    :margin React.PropTypes.number

  :getDefaultProps $ \ ()
    {} (:height 60) (:margin 20)

  :onClick $ \ (id)
    this.props.onClick id

  :render $ \ ()
    Transition
      {} (:transitionName :notifi) (:className :origami-notifications)
      ... this.props.notifications (reverse) $ map $ \\ (noti index)
        var className $ classnames :origami-notification
          + :is- (noti.get :type)
        var onClick $ \\ ()
          this.onClick $ noti.get :id
        div
          {} (:className className) (:onClick onClick)
            :key (noti.get :id)
            :style $ {}
              :top $ + this.props.margin
                * index (+ this.props.margin this.props.height)
              :height this.props.height
              :lineHeight $ + this.props.height :px
          span ({} (:className :text)) (noti.get :text)
