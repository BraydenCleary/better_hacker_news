$(document).ready(function(){
  $('#new-comment').submit(function(e){
    e.preventDefault();
    var url = this.action;
    var dataToSend = $(this).serialize();
    $.post(url, dataToSend, function(data){
      $('ul').append("<li>" + data.comment.body + "</li>");     
      $('#new-comment textarea').val('');
    });
  });
});




// var Comment = function(){
//   var init = function(){

//   }


// }

// $(document).ready(function(){
//   var comment = new Comment();
//   comment.init();
// })
