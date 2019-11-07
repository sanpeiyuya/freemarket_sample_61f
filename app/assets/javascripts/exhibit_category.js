$(function() {
  // オプションの項目作成
  function creat_html_option(elements) {
    var html = ``;
    elements.forEach(function(ele) {
      html += `<option value="${ele.id}">${ele.name}</option>`
    })
    return html
  };


  // カテゴリ2のHtml作成
  function creat_html_select_category_lv2(categories) {
    var option = creat_html_option(categories);
    var html = `<div class="content__form__Add1">
                  <label for="display_item_category_id"></label>
                  <div class="content__form__Ele__input">
                    <span class="fa fa-chevron-down arrow-icon"></span>
                    <select class="exhibit-select" name="display_item[category_id]" id="display_item_category2_id">
                    <option value="">--</option>
                    ${option}
                  </div>
                </div>`
    return html;
  };


  // カテゴリ3のHtml作成
  function creat_html_select_category_lv3(categories) {
    var option = creat_html_option(categories);
    var html = `<div class="content__form__Add2">
                  <label for="display_item_category_id"></label>
                  <div class="content__form__Ele__input">
                    <span class="fa fa-chevron-down arrow-icon"></span>
                    <select class="exhibit-select" name="display_item[category_id]" id="display_item_category3_id">
                    <option value="">--</option>
                    ${option}
                  </div>
                </div>`
    return html;
  };


  // サイズのHtml作成
  function creat_html_select_size(sizes) {
    var option = creat_html_option(sizes);
    var html = `<label for="display_item_size_id">サイズ
                  <span class="required-icon">
                    必須
                  </span>
                </label>
                <div class="content__form__Ele__input">
                  <span class="fa fa-chevron-down arrow-icon"></span>
                  <select class="exhibit-select" name="display_item[size_id]" id="display_item_size_id">
                    <option value="">--</option>
                    ${option}
                  </select>
                </div>`;
    return html;
  }


  // ブランドのhtml作成
  function create_html_brand() {
    var html = `<label for="display_item_brand_id">ブランド
                  <span class="any-icon">
                    任意
                  </span>
                </label>
                <div class="content__form__Ele__input">
                  <input class="exhibit-select" autocomplete="off" type="text" name="display_item[brand_id]" id="display_item_brand_id">
                  <div class="brand_search_result">
                    <ul class="brand_search_result__box"></ul>
                  </div>
                </div>`;
    return html;
  }


  // サイズボックスの作成
  function create_html_select_size(category_id) {
    var check = $('#display_item_size_id').val();
    // サイズボックスに値が入ってたら作り直さない
    if ( check == null ) {
      $.ajax({
        url: '/sizes/search',
        type: 'post',
        data: {
          category_id: category_id,
        },
        dataType: 'json',
      })
      .done(function(sizes) {
        if ( sizes.length >= 1 ) {
          // sizeのセレクトボックス削除
          $('.select_size').children().remove();
          // サイズhtml作成
          var html = creat_html_select_size(sizes);
          $('.select_size').append(html);
        }
      })
      .fail(function(sizes) {
        alert('サイズの取得に失敗しました');
      })
    }
  }


  // ブランドボックス作成
  function create_html_input_brand(category_id) {
    $.ajax({
      url: '/brands/enter',
      type: 'post',
      data: {
        category_id: category_id,
      },
      dataType: 'json',
    })
    .done(function(brand) {
      // ボックス未作成、且つカテゴリがブランドを持っていたらボックス作成
      if ( $('.select_brand').children().length == 0 ) {
        if ( brand.check != null ) {
          var html = create_html_brand();
          $('.select_brand').append(html);
        } else {
          // brandのボックス削除
          $('.select_brand').children().remove();
        }
      } else {
        if ( brand.check == null ) {
          // brandのボックス削除
          $('.select_brand').children().remove();
        }
      }
    })
    .fail(function() {
      alert('ブランドの取得に失敗しました')
    })
  }


  function create_html_size_and_brand(category_id) {
    // セレクトボックス作成（サイズがあれば
    create_html_select_size(category_id)
    // ブランドボックス作成（ブランドがあれば
    create_html_input_brand(category_id)
  }


  //初回読み込み、リロード、ページ切り替えで動く。
  $(document).on('turbolinks:load', function() {
    // カテゴリ1のイベント発火
    $('#display_item_category_id').on('change', function() {
      var category_id = $('#display_item_category_id').val();
      $.ajax({
        url: '/categories/search_level1',
        type: 'post',
        data: {
          category_id: category_id
        },
        dataType: 'json',
      })
      .done(function(categories) {
        // Add1とAdd2のセレクトボックスを削除
        $('.content__form__Add1').remove();
        $('.content__form__Add2').remove();
        // sizeのセレクトボックス削除
        $('.select_size').children().remove();
        if ( categories.length >= 1 ) {
          // 選択に応じたセレクトボックス作成
          var html = creat_html_select_category_lv2(categories)
          $('.select_category').append(html);
        }
      })
      .fail(function() {
        alert('カテゴリの取得に失敗しました');
      })
      var category_id = $('#display_item_category_id').val();
      create_html_size_and_brand(category_id);
    });


    // カテゴリ2のイベント発火
    $(document).on('change', '#display_item_category2_id', function() {
      // カテゴリ1の入力値取得
      var category_id = $('#display_item_category_id').val();
      // カテゴリ2の入力値取得
      var category2_id = $('#display_item_category2_id').val();
      $.ajax({
        url: '/categories/search_level2',
        type: 'post',
        data: {
          category_id: category_id,
          category2_id: category2_id
        },
        dataType: 'json',
      })
      .done(function(categories) {
        // Add2セレクトボックスを削除
        $('.content__form__Add2').remove();
        // sizeのセレクトボックス削除
        $('.select_size').children().remove();
        // 要素が１個以上あれば生成
        if (categories.length >= 1 ) {
          // 選択に応じたセレクトボックス作成
          var html = creat_html_select_category_lv3(categories)
          $('.select_category').append(html);
        } 
      })
      .fail(function() {
        alert('カテゴリの取得に失敗しました');
      })
      var category_id = $('#display_item_category2_id').val();
      create_html_size_and_brand(category_id);
    });


    // カテゴリ3のイベント発火
    $(document).on('change', '#display_item_category3_id', function() {
      var category_id = $('#display_item_category3_id').val();
      create_html_size_and_brand(category_id);
    });
  });
});