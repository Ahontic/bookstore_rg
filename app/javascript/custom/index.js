$(document).on("turbolinks:load",function() {
  $('#decrease-quantity').click(function() {
    let quantityInput = $('#quantity-input')
    let bookPrice = $('#book-price')
    let bookCost = $('#book-cost')
    if ( quantityInput.val() > 1 ) {
    let newValue = +quantityInput.val() - 1
    let unit = '€'
    quantityInput.val(newValue)
    bookCost.text(unit + newValue * bookPrice.val())
  }
  });

  $('#increase-quantity').click(function() {
    let quantityInput = $('#quantity-input')
    let bookPrice = $('#book-price')
    let bookCost = $('#book-cost')
    let newValue = +quantityInput.val() + 1
    let unit = '€'
    quantityInput.val(newValue)
    bookCost.text(unit + newValue * bookPrice.val())
  });
});

$(document).ready(function() {
  $('#delete-account-checkbox').change(function() {
    $('.delete-link button').toggleClass('btn-disabled')
    $('.delete-link button').attr('disabled', !this.checked)
  });

//custom.js
$(function() {
  $('[data-toggle="tooltip"]').tooltip();
});

$(function() {
  $('[data-toggle="popover"]').popover();
});
});
