window.App ||= {}
class App.Base

  constructor: ->
    App.transitions = new Element.Transitions
    return this

window.Element ||= {}
class Element.Transitions

  constructor: ->
    # Turbolinks < 5
    $(document).on 'page:fetch.transition', @out
    $(document).on 'page:change.transition', @in
    $(document).on 'page:before-unload.transition', @remove
    $(document).on 'page:restore.transition', @remove

    # Turbolinks >= 5
    $(document).on 'turbolinks:request-start.transition', @out
    $(document).on 'turbolinks:load.transition', @in
    $(document).on 'turbolinks:before-cache.transition', @remove

    return this


  out: =>
    $('#main-container .page-content').addClass('animated fadeOut')
    App.transitionLoader = setTimeout( ->
      $('#ajax-loader').fadeIn('slow')
    , 1500
    )
    return


  in: =>
    $('#main-container .page-content').addClass('animated fadeIn')
    setTimeout( @remove, 1000 )
    window.clearTimeout(App.transitionLoader) if App.transitionLoader?
    return


  remove: =>
    $('#main-container .page-content').removeClass('animated fadeOut fadeIn')
    $('#ajax-loader').hide()
    window.clearTimeout(App.transitionLoader) if App.transitionLoader?
    return
