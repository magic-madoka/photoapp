avatar_modal = ->
  $('.pop').on 'click', ->
    $('.imagepreview').attr 'src', $(this).find('img').attr('src')
    $('#imagemodal').modal 'show'

$(document).ready(avatar_modal)
$(document).on('page:load', avatar_modal)
