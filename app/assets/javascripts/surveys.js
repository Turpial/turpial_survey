$(document).ready(function(){
  var use_turpial = $('#survey_use_turpial')
  use_turpial.val(1)
  $('#os_field').show()
  $('#why_not').hide()

  use_turpial.on('change',function(){
    var use = parseInt(use_turpial.val())
    if (use == 0) {
      $('#os_field').hide()
      $('#why_not').show()
    } else {
      $('#why_not').hide()
      $('#os_field').show()
    }
  })

});
