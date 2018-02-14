var template = document.querySelector("#productTemplate");
var row = document.querySelector(".row");

row.appendChild(template.content.cloneNode(true));
row.appendChild(template.content.cloneNode(true));
row.appendChild(template.content.cloneNode(true));
row.appendChild(template.content.cloneNode(true));
row.appendChild(template.content.cloneNode(true));

console.log(template.content)
template.content.querySelector(".card-text").innerHTML = "A new textbook";
row.appendChild(template.content.cloneNode(true));
