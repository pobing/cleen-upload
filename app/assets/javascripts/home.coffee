setupStyle = ->
  $.getJSON '/layouts', (data) ->
    return if data.error

    page = data.page
    slot = page.slots[0]
    $('.image-upload-container').css({'width': "#{page.width/1000}%", 'height': "#{page.height/1000}%"})
    $('#slot').css({'width': "#{slot.width/1000}%", 'height': "#{slot.height/1000}%", 'left': "#{slot.center_x/1000}%", 'top': "#{slot.center_y/1000}%"})


$ ->
  # set page style with page setting form server
  setupStyle()

  $('#fileInput').on 'change', (e) ->
    file = e.target.files[0]
    return unless file
    previewDom = $('#preview')[0]
    reader = new FileReader()
    reader.onload = (e) ->
      previewDom.src = e.target.result
      previewDom.onload = ->
        file.naturalHeight

    reader.readAsDataURL(file)
    $('#preview').show()
    $('#slot').hide()

  $('#preview, #edit').on 'click', ->
    $('#fileInput').click()

  $('#preview').hover (->
    $('#edit').css({'opacity': 1, 'display': 'block'})
  ), ->
    $('#edit').css({'opacity': 0, 'display': 'none'})

