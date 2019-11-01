$(function() {

  // オプションの項目作成
  function creatOPTION(categories) {
    var html = ``;
    categories.forEach(function(category) {
      html += `<option value="${category.id}">${category.name}</option>`
    })
    return html
  };
  // カテゴリ2のHtml作成
  function creatSELECT_Add1(categories) {
    var option = creatOPTION(categories);
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
  function creatSELECT_Add2(categories) {
    var option = creatOPTION(categories);
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
  // カテゴリ1のイベント発火
  $('#display_item_category_id').on('change', function() {
    var category_id = $('#display_item_category_id').val();
    $.ajax({
      url: '/display_items/first_category_search',
      type: 'post',
      data: {
        category_id: category_id
      },
      dataType: 'json',
    })
    .done(function(categories) {
      // Add1セレクトボックスを削除
      $(`.content__form__Add1`).remove();
      $(`.content__form__Add2`).remove();
      if ( categories.length >= 1 ) {
        // 選択に応じたセレクトボックス作成
        var html = creatSELECT_Add1(categories)
        $('.select_category').append(html);
      }
    })
    .fail(function() {
      alert('カテゴリの取得に失敗しました');
    })
  });
  // カテゴリ2のイベント発火
  $(document).on('change', '#display_item_category2_id', function() {
    // カテゴリ1の入力値取得
    var category_id = $('#display_item_category_id').val();
    // カテゴリ2の入力値取得
    var category2_id = $('#display_item_category2_id').val();
    $.ajax({
      url: '/display_items/second_category_search',
      type: 'post',
      data: {
        category_id: category_id,
        category2_id: category2_id
      },
      dataType: 'json',
    })
    .done(function(categories) {
      // Add1セレクトボックスを削除
      $(`.content__form__Add2`).remove();
      // 要素が１個以上あれば生成
      if (categories.length >= 1 ) {
        // 選択に応じたセレクトボックス作成
        var html = creatSELECT_Add2(categories)
        $('.content__form__TopEle').append(html);
      } 
    })
    .fail(function() {
      alert('カテゴリの取得に失敗しました');
    })
  });

});