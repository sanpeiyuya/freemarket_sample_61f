$(function() {

  // リスト作成
  function creatList(brands) {
    var html = ``;
    brands.forEach(function(brand) {
      html += `<li class="brand_search_result__box__content" id=${brand.id}>${brand.name}</li>`;
    })
    return html;
  }
  // ブランド検索機能
  $('#display_item_brand_id').on('keyup', function() {
    // リストを空にする
    $('.brand_search_result__box').children().remove();
    // キーワード取得
    var keyword = $('#display_item_brand_id').val();
    // キーワードが空の時は何もしない
    if ( keyword != "" ) {
      $.ajax({
        url: '/display_items/brand_search',
        type: 'post',
        data: {
          keyword: keyword,
        },
        dataType: 'json',
      })
      .done(function(brands) {
        var html = creatList(brands)
        $('.brand_search_result__box').append(html);
      })
      .fail(function() {
        alert("ブランドの取得に失敗しました");
      })
    }
  });

  // ブランド選択機能
  $(document).on('click', ".brand_search_result__box__content", function() {
    // クリックされた要素の名前を取得
    var text = this.innerText;
    // 名前をinputに挿入
    $("#display_item_brand_id").val(text);
    // 検索リスト削除
    $('.brand_search_result__box').children().remove();
  });
});