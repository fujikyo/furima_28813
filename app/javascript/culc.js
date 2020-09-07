window.addEventListener('keyup', function(){
const inputtedPrice = document.getElementById("item-price").value;
const taxPrice = Math.round(inputtedPrice * 0.1);
const profitPrice = inputtedPrice - taxPrice;

const getTaxClass = document.getElementById("add-tax-price")
const getProfitClass = document.getElementById("profit")
getTaxClass.innerHTML = taxPrice
getProfitClass.innerHTML = profitPrice
})