$('input').on('input propertychange', function () {
  $('input').urlive("remove", 200, "slow");
   $('input').urlive({
    imageSize: "small",
    disableClick: true
  });
}).trigger('input');