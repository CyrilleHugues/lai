_ = require 'lodash'
ctrl = require './engine/controller.coffee'

controllers =
  jom: ctrl(
      template: "
        <p id='comp' lai-compute='greetings'>Dat pun!</p>
        <p>
          <input lai-model='name' type='text' value=''>
        </p>
        <textarea lai-model='name'>
        "
      scope:
        name: 'Mr. Jo'
      computed:
        greetings: (scope) -> 'Hello ' + scope.name + ' !'
    )

window.onload = ->
  _.forEach document.querySelectorAll('[lai-app]'), (node) ->
    ctrl = controllers[node?.getAttribute('lai-app')]
    ctrl.attach node

module.exports = ''
