// $(function(){
//   $('.lyric a').mouseover(function(){
//     $(this).parent().siblings('.lyric-tool-tip').css('display', 'block');
//   });
//     $('.lyric a').mouseout(function(){
//     $(this).parent().siblings('.lyric-tool-tip').css('display', 'none');
//   });
// });

$(function(){
  $('.lyric a').mouseover(function(){
    $(this).parent().siblings('.lyric-tool-tip').fadeIn("400");
  });
    $('.lyric a').mouseout(function(){
    $(this).parent().siblings('.lyric-tool-tip').fadeOut("400");
  });
});

$(function(){
  $('.signin a').mouseover(function(){
    $(this).parent().siblings('.signin-tooltip').fadeIn("400");
  });
    $('.signin-wrapper').mouseleave(function(){
    $('.signin a').parent().siblings('.signin-tooltip').fadeOut("400");
  });
});