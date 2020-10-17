addEventListener('turbolinks:load', function(){

  const sell = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  sell.addEventListener('input', function(){
    const price = this.value
    const taxPrice = Math.floor(price * 0.1 )
    const profitPrice = Math.floor(price - taxPrice )
    tax.innerHTML = taxPrice.toLocaleString();
    profit.innerHTML = profitPrice.toLocaleString();
  })
})