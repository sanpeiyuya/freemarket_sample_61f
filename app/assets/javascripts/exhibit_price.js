$(function() {


  function remove_html_price_area() {
    $('.content__form__list-B__right').remove();
    $('.content__form__list-C__right').remove();
  }


  function calc_commission_rate(price) {
    var commission_rate = Math.floor(price * 0.1).toLocaleString();
    return commission_rate;
  }


  function calc_sales(price) {
    var sales = Math.floor(price * 0.9).toLocaleString();
    return sales;
  }


  function create_html_commission_rate_after_append(commission_rate) {
    if ( commission_rate != '-' ) {
      var html = `<div class="content__form__list-B__right">¥${commission_rate}</div>`
    } else {
      var html = `<div class="content__form__list-B__right">${commission_rate}</div>`
    }
    $('.content__form__list-B').append(html);
  }


  function create_html_sales_after_append(sales) {
    if ( sales != '-' ) {
      var html = `<div class="content__form__list-B__right">¥${sales}</div>`
    } else {
      console.log(sales);
      var html = `<div class="content__form__list-B__right">${sales}</div>`
    }
    $('.content__form__list-C').append(html);
  }


  $('#display_item_price').on('keyup', function() {

    var price = $('#display_item_price').val();

    // 表示切り替えエリアをリセット
    remove_html_price_area()

    // 入力値に応じて、処理を切り替え
    if ( price >= 300 && price <= 9999999 ) {
      var commission_rate = calc_commission_rate(price)
      var sales = calc_sales(price)

      // 手数料のビューを取り付け
      create_html_commission_rate_after_append(commission_rate)
      // 売上のビューを取り付け
      create_html_sales_after_append(sales)
    } else {
      // 手数料のビューを取り付け
      create_html_commission_rate_after_append("-")
      // 売上のビューを取り付け
      create_html_sales_after_append("-")
    }
  });
});