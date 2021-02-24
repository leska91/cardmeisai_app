function order() {
  const orders = document.querySelectorAll(".orderInfo");
  for(let i = 0; i < orders.length; i++){
    orders[i].addEventListener('click',function(){
      if (orders[i].getAttribute("style") == "background-color:#FAFAD2;") {
        orders[i].setAttribute("style", "background-color:#FFFFFF;")
      } else {
        orders[i].setAttribute("style", "background-color:#FAFAD2;")
      }
    },false);
  };
}

window.addEventListener('load', order);