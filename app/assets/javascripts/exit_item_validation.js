$(function() {

  function create_alert_html(message) {
    var html = `<div class="alert-message" style="color:red; margin-top:10px; font-weight:bold;">${message}</div>`
    return html
  }


  $('.edit_display_item').on('submit', function(e) {

    // エラーメッセージを削除
    $('.alert-message').remove();
    // エラー件数チェック用
    var check = 0;

    // 画像の有無を判定
    var images = document.getElementsByClassName('image__box__preview');
    if ( images.length == 0 ) {
      var html = create_alert_html("画像は1枚以上必要です")
      $('.image__box').append(html)
      check += 1
    }

    var title = $('.title__name__input').val()
    // 「商品名」の有無を判定
    if ( !title ) {
      var html = create_alert_html("商品名を入力してください")
      $('.title__name').append(html)
      check += 1
    }
    // 「商品名」の文字数を判定
    if ( title.length >= 40 ) {
      console.log(title.length);
      var html = create_alert_html("商品名は40文字以下で入力してください")
      $('.title__name').append(html)
      check += 1
    }

    var detail = $('.title__description__input').val()
    // 「商品の説明」の有無を判定
    if ( !detail ) {
      var html = create_alert_html("商品の説明を入力してください")
      $('.title__description').append(html)
      check += 1
    }
    // 「商品の説明」の文字数を判定
    if ( detail.length >= 1000 ) {
      console.log(title.length);
      var html = create_alert_html("商品の説明は1,000文字以下で入力してください")
      $('.title__description').append(html)
      check += 1
    }

    var category_lv1 = $('.display_item_category_1').val();
    var category_lv2 = $('.display_item_category_2').val();
    var category_lv3 = $('.display_item_category_3').val();
    // 「カテゴリー1」の有無を判定
    if ( !category_lv1 ) {
      var html = create_alert_html("カテゴリーを入力してください")
      $('.content__form__TopEle__input').append(html)
      check += 1
    }
    // 「カテゴリー2」の有無を判定
    if ( document.getElementById("display_item_category2_id") != null ) {
      if ( !category_lv2 ) {
        var html = create_alert_html("カテゴリーを入力してください")
        $('.content__form__Add1').append(html)
        check += 1
      }
    }
    // 「カテゴリー3」の有無を判定
    if ( document.getElementById("display_item_category3_id") != null ) {
      if ( !category_lv3 ) {
        var html = create_alert_html("カテゴリーを入力してください")
        $('.content__form__Add2').append(html)
        check += 1
      }  
    }

    // 「サイズ」の有無を判定
    if ( document.getElementById("display_item_size_id") != null ) {
      var size = $('#display_item_size_id').val();
      if ( !size ) {
        var html = create_alert_html("サイズを入力してください")
        $('.select_size').append(html)
        check += 1
      }  
    }

    // 「商品の状態」の有無を判定
    var condition = $('.display_select_condition').val();
    if ( !condition ) {
      var html = create_alert_html("商品の状態を入力してください")
      $('.select_condition').append(html)
      check += 1
    }

    // 「配送料の負担」の有無を判定
    var burden = $('.display_select_burden').val();
    if ( !burden ) {
      var html = create_alert_html("配送料の負担を入力してください")
      $('.select_delivery_fee').append(html)
      check += 1
    }

    // 「配送方法」の有無を判定
    if ( document.getElementsByClassName("display_select_method") != null ) {
      var method = $('.display_select_method').val();
      if ( !method ) {
        var html = create_alert_html("配送方法を入力してください")
        $('.select_delivery_method').append(html)
        check += 1
      }  
    }

    // 「配送元の地域」の有無を判定
    var prefecture = $('.display_select_prefecture').val();
    if ( !prefecture ) {
      var html = create_alert_html("配送元の地域を入力してください")
      $('.select_prefecture').append(html)
      check += 1
    }

    // 「発送までの日数」の有無を判定
    var by_day = $('.display_select_by_day').val();
    if ( !by_day ) {
      var html = create_alert_html("発送までの日数を入力してください")
      $('.select_by_day').append(html)
      check += 1
    }

    var price = $('.display_item_price').val();
    // 「価格」の有無を判定
    if ( !price ) {
      var html = create_alert_html("価格を入力してください")
      $('.content__form__list-A__box').append(html)
      check += 1
    }
    if ( price < 300 || price > 9999999 ) {
      var html = create_alert_html("300円~999万円で入力してください")
      $('.content__form__list-A__box').append(html)
      check += 1
    }

    // エラーがあれば、送信しない
    if ( check != 0 ) {
      var html = create_alert_html(`${check}件の誤りがあります`);
      $('.exhibit__main__box__title').append(html)
      // トップへスクロール
      $(".exhibit__main").get(0).scrollIntoView(true);
      e.preventDefault();
    }

  })
});