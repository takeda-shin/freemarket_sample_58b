$(function(){
  $(".price-box").on("keyup",function(){
    var price = $(this).val();
    var fee = Math.floor(price * 0.1);
  var profit = price - fee
  $(".sale__display__commission__text").html("¥ " + fee);
  $(".sale__display__profit__text").html("¥ " + profit);
    })
  
  
  $(".product-category__box").on("change",function(){
    var list = ["--","one","two","three"];
    let childForm = `
    <form action = "/" accept-charset = "UTF-8" method = "POST" class = "child-box">
      <select class = "product-category__child-box" name = "child-category">
    `
    $(".product-childcategory").html(childForm);
    $(".sell-body").css('height','2100');

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
    $(".sell-body").css('height','2170');

    let grandchildForm2 = `
    ${list.forEach(function(value){
      let grandchildForm3= `<option value>${value}</option>`
      $(".product-category__grandchild-box").append(grandchildForm3);
    })
    }
    `
    ;
    $(".grandchild-category").html(grandchildForm);
  })

  $(".product-grandchildcategory").on("change", function(){
    var list = ["--", "S", "M", "L", "XL"];
    var brand = ["--","1","3","5","7"];
    let sizeForm = `
      <div class = "contain">
      サイズ
      <span class="product-size__require">必須</span>
      <form action = "/" accept-charset = "UTF-8" method = "POST" class = "product-size">
        <select class = "product-size__box" name = "product_size">
      </div>
      `
      $(".product-size__contain").remove();
      $(".product-size").append(sizeForm);
      $(".sell-body").css('height','2450');

      let sizeForm2 = `
      ${list.forEach(function(value){
        let sizeForm3= `<option value = ${value}>${value}</option>`
        $(".product-size__box").append(sizeForm3);
      })
      }
      `
    let brandForm = `
      <div class = "contain">
      ブランド
      <span class="product-brand__free">任意</span>
      <form action = "/" accept-charset = "UTF-8" method = "POST" class = "product-size">
        <select class = "product-brand__box" name = "brand">
      </div>
      `
      $(".product-brand__contain").remove();
      $(".product-brand").append(brandForm);
      
      let brandForm2 = `
      ${brand.forEach(function(value){
        let brandForm3= `<option value = ${value}>${value}</option>`
        $(".product-brand__box").append(brandForm3);
      })
      }
      `
      ;

  })

  $(".product-image__dropbox").on("change",function(){
    var image = $(this).val();
    let html = `
      <div class = "image__pre">
        <img src = "${image}" height = "162">
      </div>
    `
    ;
    $(".image").append(html);
    $(".image").css({'border':'solid 1px #000','float':'left'});
    $(".product-image__dropbox").css('width','400');
  })
  
});