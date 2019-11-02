$(function() {
  $('#display_item_price').on('keyup', function() {
    var price = $('#display_item_price').val();
    // 表示切り替えエリアをリセット
    $('.content__form__list-B__right').remove();
    $('.content__form__list-C__right').remove();
    // 入力値に応じて、処理を切り替え
    if ( price >= 300 && price <= 9999999 ) {
      var commission_rate = Math.floor(price * 0.1).toLocaleString();
      var sales = Math.floor(price * 0.9).toLocaleString();
      console.log(commission_rate, sales);

      var html = `<div class="content__form__list-B__right">¥${commission_rate}</div>`
      $('.content__form__list-B').append(html);
      var html = `<div class="content__form__list-C__right">¥${sales}</div>`;
      $('.content__form__list-C').append(html);
    } else {
      var html = `<div class="content__form__list-B__right">-</div>`
      $('.content__form__list-B').append(html);
      var html = `<div class="content__form__list-C__right">-</div>`;
      $('.content__form__list-C').append(html);
    }
  });
});