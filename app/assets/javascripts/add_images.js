$(function () {
  //初回読み込み、リロード、ページ切り替えで動く。
  $(document).on('turbolinks:load', function() {


    function create_input_html(num) {
      var html = `<label class="image__box__label" id="input_${num}" for="display_item_images_attributes_${num}_image">
                    <div class="image__box__input-area">
                      <input class="image__box__input-area__tag" type="file" name="display_item[images_attributes][${num}][image]" id="display_item_images_attributes_${num}_image">
                      <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                    </div>
                  </label>`;
      return html
    }


    var target = $('.image__box__input-area__tag');

    $(document).on('change', '.image__box__input-area__tag', function(e) {
      // 同名クラス名を取得
      var obj = document.querySelectorAll(".image__box__label");
      var num = obj.length;
      // 非表示
      var name = "input_" + String(num-1);
      console.log(name)
      $('#' + name).css('display','none');
      // html作成
      var html = create_input_html(num);
      $('.image__box').append(html);


    })
  });
});