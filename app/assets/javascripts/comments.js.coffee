jQuery ->
  $(".comment-form")
  .on "ajax:beforeSend", (evt, xhr, settings) ->
    debugger
    $(@).find('textarea')
    .addClass('uneditable-input')
    .attr('disabled', 'disabled');
  .on "ajax:success", (evt, data, status, xhr) ->
    debugger
    $(@).find('textarea')
    .removeClass('uneditable-input')
    .removeAttr('disabled', 'disabled')
    .val('');
    $(xhr.responseText).hide().insertAfter($(this)).show('slow')