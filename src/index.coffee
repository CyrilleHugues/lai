_ = require 'lodash'
#controllers = require('./controllers.json')

window.onload = ->
  controllers =
    jom:
      template: _.template "Hello <%= user %>"
      scope:
        user: 'Marjo'

  _.forEach document.querySelectorAll('[lai-app]'), (node) ->
    ctrl = controllers[node?.getAttribute('lai-app')]
    node.innerHTML = ctrl.template ctrl.scope

module.exports = ''
