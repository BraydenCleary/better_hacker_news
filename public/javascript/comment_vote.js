$(document).ready(function(){
  $('.comment-upvote-symbol').on('click', function(e){
    e.preventDefault();
    $.get(this.href, function(data){
      $('#' + data.comment_id + ' .comment-votes').text(data.number_of_votes);
    });
  });
});
