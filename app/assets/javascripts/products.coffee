jQuery ->
  $("select#product_variants").on "change", (e)->
    qweqw(e)

  qweqw = (e)->
    $target = $(e.target)
    variant = $target.val()
    $productRow = $target.closest('.variants').find('.details')
    url = $productRow.data('url')
    $.ajax
      url:        url
      method:     'GET'
      dataType:   'html'
      data:       { variant: variant }
      success: (result)->
        $('.variants').replaceWith(result)
        $("select#product_variants").on "change", (e)->
          qweqw(e)

# categories page

  $("select#product_cat_variants").on "change", (e)->
    qweqw(e)

  qweqw = (e)->
    $target = $(e.target)
    variant = $target.val()
    $productRow = $target.closest('.variants').find('.details')
    url = $productRow.data('url')
    $.ajax
      url:        url
      method:     'GET'
      dataType:   'html'
      data:       { variant: variant }
      success: (result)->
        $('.variants').replaceWith(result)
        $("select#product_variants").on "change", (e)->
          qweqw(e)

# ro reviews    

  $('.to-review-anchor').on 'click', ->
    $('#reviews').click()

  $('.to-review-btn-anchor').on 'click', ->
    $('#reviews').click()
    $('.btn.add-comment').click()