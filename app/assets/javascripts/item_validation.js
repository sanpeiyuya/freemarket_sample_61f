$(function() {

  function create_alert_html(message) {
    var html = `<div class="alert-message" style="color:red; margin-top:10px; font-weight:bold;">${message}</div>`
    return html
  }


  $('#new_display_item').on('submit', function(e) {
    e.preventDefault();
    $('.alert-message').remove();

    var check = 0;

    // 画像の有無を判定
    var images = document.getElementsByClassName('image__box__preview');
    if ( images.length == 0 ) {
      var html = create_alert_html("画像は1枚以上必要です")
      $('.image__box').append(html)
      check += 1
    }

    var title = $('#display_item_name').val()
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

    var detail = $('#display_item_description').val()
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

    var category_lv1 = $('#display_item_category_id').val();
    var category_lv2 = $('#display_item_category2_id').val();
    var category_lv3 = $('#display_item_category3_id').val();
    // 「カテゴリー1」の有無を判定
    if ( !category_lv1 ) {
      var html = create_alert_html("カテゴリーを入力してください")
      $('.select_category').append(html)
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
    var condition = $('#display_item_condition_id').val();
    if ( !condition ) {
      var html = create_alert_html("商品の状態を入力してください")
      $('.select_condition').append(html)
      check += 1
    }

    // 「配送料の負担」の有無を判定
    var burden = $('#display_item_delivery_fee_burden_id').val();
    if ( !burden ) {
      var html = create_alert_html("配送料の負担を入力してください")
      $('.select_delivery_fee').append(html)
      check += 1
    }

    // 「配送方法」の有無を判定
    if ( document.getElementById("display_item_delivery_method_id") != null ) {
      var method = $('#display_item_delivery_method_id').val();
      if ( !method ) {
        var html = create_alert_html("配送方法を入力してください")
        $('.select_delivery_method').append(html)
        check += 1
      }  
    }

    // 「配送元の地域」の有無を判定
    var prefecture = $('#display_item_prefecture_id').val();
    if ( !prefecture ) {
      var html = create_alert_html("配送元の地域を入力してください")
      $('.select_delivery_prefecture').append(html)
      check += 1
    }

    // 「発送までの日数」の有無を判定
    var by_day = $('#display_item_delivery_by_day_id').val();
    if ( !by_day ) {
      var html = create_alert_html("発送までの日数を入力してください")
      $('.select_delivery_by_day').append(html)
      check += 1
    }




    console.log("checkは" + check);

  })
});