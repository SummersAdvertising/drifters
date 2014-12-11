$(document).ready(function(){
    $('.bxslider').bxSlider({
      controls:false,
      pager:false,
      auto:true,
      infiniteLoop:true,
      mode:'vertical'
    });
    $('#article-3').parallax({offsetY:-150,speedFactor:.3}); 
    $('#article-4').parallax({offsetY:-150,speedFactor:.3}); 
    $('#article-5').parallax({offsetY:-150,speedFactor:.3}); 
  });   

jQuery(document).ready(function(){  
  var controller = $.superscrollorama();
  controller.addTween('#content-1', 
  TweenMax.from($('#content-1 .pull-right img'), 1, 
    {css:{top: 100,left: 50,opacity:0}}
  )).addTween('#content-2', 
  TweenMax.from($('#content-2 .pull-left img'), 1, 
    {css:{bottom: 100,right: 50,opacity:0}}
  )).addTween('#content-3', 
  TweenMax.from($('#content-3 .pull-right img'), 1, 
    {css:{bottom: 100,left: 50,opacity:0}}
  )).addTween('#content-4', 
  TweenMax.from($('#content-4 .pull-left img'), 1, 
    {css:{top: 100,right: 50,opacity:0}}
  )).addTween('#article-3', 
  TweenMax.to($('#article-3 .level img'), 1, 
    //{css:{'background-image':'url(http://park.summers.com.tw/toto/drifters/images/idx-27.png)'}}
    {css:{opacity:1}}
  )).addTween('#article-4', 
  TweenMax.to($('#article-4 .level img'), 1, 
    //{css:{'background-image':'url(http://park.summers.com.tw/toto/drifters/images/idx-28.png)'}}
    {css:{opacity:1}}
  )).addTween('#article-5', 
  TweenMax.to($('#article-5 .level img'), 1, 
    //{css:{'background-image':'url(http://park.summers.com.tw/toto/drifters/images/idx-29.png)'}}
    {css:{opacity:1}}
  ))

  .addTween('#article-2', 
    (new TimelineLite()).append([
      TweenMax.to($('#car'), 1, 
        {css:{top:'95%'}}
      )
    ]),3000 // scroll duration of tween
  )
  .addTween('#article-2', 
    (new TimelineLite()).append([
      TweenMax.to($('#car-m'), 1, 
        {css:{top:'95%'}}
      )
    ]),3000 // scroll duration of tween
  )

  .addTween('#content-1', 
    (new TimelineLite()).append([
      TweenMax.fromTo($('#item-1'), 1, 
        {css:{top:'30%'}},{css:{top:'15%'}}
      )
    ]),1000 // scroll duration of tween
  ).addTween('#content-3', 
    (new TimelineLite()).append([
      TweenMax.fromTo($('#item-2'), 1, 
        {css:{bottom:'0'}},{css:{bottom:'15%'}}
      )
    ]),1000 // scroll duration of tween
  )
});