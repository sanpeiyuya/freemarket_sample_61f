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

    function create_preview_list() {
      var list = `<li class="image__box__previews__preview">
                    <div class="image__box__previews__preview__frame">
                      <img class="image__box__previews__preview__frame__image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgnlJfqXSx9SgF5N69hVtK1-WvFWBcATk1VpITCFmrieh3-fga" alt="Images?q=tbn%3aand9gctgnljfqxsx9sgf5n69hvtk1 wvfwbcatk1vpitcfmrieh3 fga">
                    </div>
                    <div class="image__box__previews__preview__btns">
                      <div class="image__box__previews__preview__btns__btn">
                        編集
                      </div>
                      <div class="image__box__previews__preview__btns__btn">
                        削除
                      </div>
                    </div>
                  </li>`;
      return list
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
      // inputのhtml作成
      var html = create_input_html(num);
      $('.image__box').append(html);
      // listのhtml作成
      var list = create_preview_list();
      $('.image__box__previews').append(list);
    })
  });
});