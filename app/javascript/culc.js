window.addEventListener('keyup', function(){
const inputtedPrice = document.getElementById("item-price").value;
const taxPrice = Math.round(inputtedPrice * 0.1);
const profitPrice = inputtedPrice - taxPrice;

const a = document.getElementById("add-tax-price")
const b = document.getElementById("profit")
a.innerHTML = taxPrice
b.innerHTML = profitPrice
})