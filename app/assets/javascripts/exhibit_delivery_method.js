$(function() {
  // オプションの項目作成
  function creatOption(methods) {
    var html = ``;
    methods.forEach(function(method) {
      html += `<option value="${method.id}">${method.name}</option>`
    })
    return html
  };
  // html作成
  function createMethod(methods) {
    var option = creatOption(methods);
    var html = `<label for="display_item_delivery_method_id">配送方法
                  <span class="required-icon">
                    必須
                  </span>
                </label>
                <div class="content__form__Ele__input">
                  <span class="fa fa-chevron-down arrow-icon"></span>
                  <select class="exhibit-select" name="display_item[delivery_method_id]" id="display_item_delivery_method_id">
                    <option value="">--</option>
                    ${option}
                  </select>
                </div>`;
    return html;
  }

  $('#display_item_delivery_fee_burden_id').on("change", function() {
    // 配送方法を削除
    $('.select_delivery_method').children().remove();
    var burden_id = $('#display_item_delivery_fee_burden_id').val();
    // --が選択されたら配送方法を削除
    if ( burden_id == "" ) {
      $('.select_delivery_method').children().remove();
    } else {
      $.ajax({
        url: '/delivery_methods/search',
        type: 'post',
        data: {
          burden_id: burden_id,
        },
        dataType: 'json',
      })
      .done(function(methods) {
        var html = createMethod(methods);
        $('.select_delivery_method').append(html);
      })
      .fail(function() {
        alert("配送方法の取得に失敗しました");
      })
    }
  });
});