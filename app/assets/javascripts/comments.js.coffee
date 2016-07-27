jQuery ->
  $(".comment-form")
  .on "ajax:beforeSend", (evt, xhr, settings) ->
    $(@).find('textarea')
    .addClass('uneditable-input')
    .attr('disabled', 'disabled');
  .on "ajax:success", (evt, data, status, xhr) ->
    $(@).find('input[type=text], textarea')
    .removeClass('uneditable-input')
    .removeAttr('disabled', 'disabled')
    .val('');
    $('.add-comment').removeAttr('disabled')
    $(@).hide()
    $(xhr.responseText).hide().insertAfter($(this)).show('slow')

  $('.add-comment').on 'click', (e)->
    $form = $('.comment-form').show('slow')
    $(e.target).attr('disabled', 'disabled')