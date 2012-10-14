$(document).ready(function(){
  $('#survey_use_turpial_true').click();
  $('#os_field').show();
  $('#why_not').hide();

  $('#survey_use_turpial_false').live('click',function(){
    console.log('hidding');
    $('#os_field').hide();
    $('#why_not').show();
  });

  $('#survey_use_turpial_true').live('click',function(){
    console.log('showing');
    $('#os_field').show();
    $('#why_not').hide();
  });

});
