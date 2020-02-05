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

  const ratyAssetsPath = process.env.NODE_ENV == 'development' ? '/assets/' : ''
  $('.review-rating').raty({
      readOnly: true,
      score: function() {
          return $(this).attr('data-score');
      },
      path: '/assets/'
  });

  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
});


$(document).ready(function() {
  $('#delete-account-checkbox').change(function() {
    $('.delete-link button').toggleClass('btn-disabled')
    $('.delete-link button').attr('disabled', !this.checked)
  });
});

//custom.js
$(function() {
  $('[data-toggle="tooltip"]').tooltip();
});

$(function() {
  $('[data-toggle="popover"]').popover();
});

$(function() {

    var checkbox = $("#hide_address");
    var hidden = $("#hidden_fields");
    hidden.show();
    checkbox.change(function() {
      if (checkbox.is(':checked')) {
        hidden.hide();
      } else {
        hidden.show();
      }
    });
  });

