
function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1)
    console.log(addTaxDom);
  const addProfit = document.getElementById("profit");
    addProfit.innerHTML = priceInput.value - Math.floor(priceInput.value * 0.1);
  })
};

window.addEventListener('load', count);
