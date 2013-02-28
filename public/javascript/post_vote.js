$(document).ready(function(){
  $('.upvote-symbol').on('click',function(e){
    e.preventDefault();
    $.get(this.href, function(data){
      // debugger;
      var targetId = data.post_vote.post_vote.post_id;
      $('#' + targetId + " span.votes").html(data.votes);
      $('#' + targetId + " .upvote-symbol").html("");
    });
  });
});
