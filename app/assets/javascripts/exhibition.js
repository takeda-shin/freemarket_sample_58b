$(function(){
  $(".price-box").on("keyup",function(){
    var price = $(this).val();
    var fee = Math.floor(price * 0.1);
  $(".sale-commission").text("¥ " + fee);
    var profit = price - fee
    $(".sale-profit").text("¥ " + profit);
    })
  
  
  $(".product-category__box").on("change",function(){
    var list = ["--","one","two","three"];
    let childForm = `
    <form action = "/" accept-charset = "UTF-8" method = "POST" class = "child-box">
      <select class = "product-category__child-box" name = "child-category">
    `
    $(".product-childcategory").html(childForm);

    let childForm2 = `
    ${list.forEach(function(value){
      let childForm3= `<option value>${value}</option>`
      $(".product-category__child-box").append(childForm3);
    })
    }
    `
  });

  $(".product-childcategory").on("change",function(){
    var list = ["--","ein","zwei","drei"];
    let grandchildForm = `
      <form action = "/" accept-charset = "UTF-8" method = "POST" class = "product-category__grandchild-box">
        <select class = "product-category__grandchild-box"" name = "grandchild-category">
      `
    $(".product-grandchildcategory").html(grandchildForm);

    let grandchildForm2 = `
    ${list.forEach(function(value){
      let grandchildForm3= `<option value>${value}</option>`
      $(".product-category__grandchild-box").append(grandchildForm3);
    })
    }
    `
    ;
    $(".grandchild-category").html(html);
  })

  // $(".image").on("change",function(){
  //   var image = $(this).val();
  //   let html = `
  //     <div class = "image__pre">
  //       <img src = "${image}" height = "500">
  //     </div>
  //   `
  //   ;
  //   $(".image").append(html);
  // })
  
});