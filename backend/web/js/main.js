$(function(){
  //get the click event button
  $('#modalButton').click(function(){
      $('#modal').modal('show')
      .find('#modalContent')
      .load($(this).attr('value'));
  });
});
