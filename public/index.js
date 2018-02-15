/* global axios */
var productTemplate = document.querySelector("#product-card");
var productRow = document.querySelector(".row");

// productRow.appendChild(productTemplate.content.cloneNode(true));
// productRow.appendChild(productTemplate.content.cloneNode(true));
// productRow.appendChild(productTemplate.content.cloneNode(true));

axios.get("https://rob-mini-cap.herokuapp.com/products").then(function(response){
  var products = response.data;
  console.log(response.data)

  products.forEach(function(product){
    var productCard = productTemplate.content.cloneNode(true);
    productCard.querySelector(".card-title").innerText = product.title;
    productCard.querySelector(".description").innerText = product.description;
    productCard.querySelector(".price").innerText = "$"+ product.price
    productRow.appendChild(productCard);
  })
})