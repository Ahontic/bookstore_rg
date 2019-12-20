$(document).ready(function() {
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
  $('.delete-link').on('click', function(e) {
    var customer_id = $(this).attr("data-id");
    if($("#delete_" + customer_id).is(':checked')) {
      $("#customer_" + customer_id).trigger('click');
    }else{
      alert('Please check the checkbox!')
  }
  });
});
