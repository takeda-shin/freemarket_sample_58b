$(function(){
  $('.product-show-body__buy__top__photo__select__mini-image').mouseover(function(){
    url = $(this).attr("src");
    $(".product-show-body__buy__top__photo__view__image").attr("src", url);    
  })
})
