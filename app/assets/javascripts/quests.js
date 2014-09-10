$(function () {
  loadDateTimePicker();
  $(document).on('page:load', loadDateTimePicker);
});



var loadDateTimePicker = function() {
  $('.datetimepicker').datetimepicker();
};
