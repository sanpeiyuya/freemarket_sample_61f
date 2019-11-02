$(function() {

  function creatList(brands) {
    var html = ``;
    brands.forEach(function(brand) {
      html += `<li class="brand_search_result__box__content" id=${brand.id}>${brand.name}</li>`;
    })
    return html;
  }

  $('#display_item_brand_id').on('keyup', function() {
    // リストを空にする
    $('.brand_search_result__box').children().remove();
    var keyword = $('#display_item_brand_id').val();
    // キーワードが空の時は何もしない
    if ( keyword != "" ) {
      console.log("通った");
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
});