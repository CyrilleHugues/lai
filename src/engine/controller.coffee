module.exports = (config) ->
  ctrl = {
    config: config
    node: null
    elements: []
  }

  ctrl.compile = ->
    @node.innerHTML = _.template(@config.template) @config.scope
    @singleLink()
    @dblLink()

  ctrl.singleLink = ->
    _.forEach @node.querySelectorAll('[lai-compute]'), (element) =>
      computedAttributeName = element.getAttribute('lai-compute')
      if not _.has @config.computed, computedAttributeName
        console.warn 'this element was linked to a non-existing computed value', element
        return
      @elements.push element
      compilationFn = _.get @config.computed, computedAttributeName
      element.compile = (scope) -> @innerHTML = compilationFn scope

  ctrl.dblLink = ->
    _.forEach @node.querySelectorAll('[lai-model]'), (element) =>
      attachement = element.getAttribute('lai-model')
      if not _.has @config.scope, attachement
        console.warn 'this element was linked to a non-existing scope value', element
        return
      #element.value = _.get @config.scope, attachement
      @elements.push element
      element.compile = (scope) -> @value = _.get scope, @getAttribute('lai-model')
      element.addEventListener 'keyup', (event) =>
        _.set @config.scope, attachement, event.target.value
        @update()

  ctrl.update = ->
    me = @
    _.map @elements, (element) -> element.compile(me.config.scope)

  ctrl.attach = (node) ->
    @node = node
    @compile()
    @update()

  return ctrl
