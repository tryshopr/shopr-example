jQuery ->
  $("select#product_variants").on "change", (e) ->
    quantity = $(@).val()
    $productRow = $(@).closest('.variants').find('.details')
    url = $productRow.data('url')
    $.ajax
      url:        url
      method:     'GET'
      dataType:   'html'
      data:       { variant: $("select#product_variants").val() }
      success: (result)->
        $('.variants').replaceWith(result)
        changeVariant()

  changeVariant = ->
    $("select#product_variants").on "change", (e) ->
      quantity = $(@).val()
      $productRow = $(@).closest('.variants').find('.details')
      url = $productRow.data('url')
      $.ajax
        url:        url
        method:     'GET'
        dataType:   'html'
        data:       { variant: $("select#product_variants").val() }
        success: (result)->
          $('.variants').replaceWith(result)
          changeVariant()