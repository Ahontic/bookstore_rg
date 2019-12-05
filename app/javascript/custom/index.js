$(document).ready(function() {
  $('#decrease-quantity').click(function() {
    let quantityInput = $('#quantity-input')
    let bookPrice = $('#book-price')
    let bookCost = $('#book-cost')
    let newValue = +quantityInput.val() + 1
    let unit = '€'
    quantityInput.val(newValue)
    bookCost.text(unit + newValue * bookPrice.val())

  })
})
