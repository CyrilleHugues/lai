@controllers = {}

module.exports =
  controller: (name, func) ->
    @controllers[name] = func
