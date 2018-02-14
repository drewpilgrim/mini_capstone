var template = document.querySelector("#productTemplate");
var row = document.querySelector(".row");


console.log(template.content);

axios.get("http://localhost:3000/products").then(function(response){
  var products = response.data;
  console.log(response.data);


  for (var i = 0; i < products.length; i++) {
    var card = template.content.cloneNode(true);
    template.content.querySelector(".card-name").innerHTML = products[i].title;
    template.content.querySelector(".card-description").innerHTML = products[i].description;
    template.content.querySelector(".card-price").innerHTML = products[i].price;

    row.appendChild(card);
  }

});
