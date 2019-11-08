$(function () {
    // 上段のinput作成
    function create_input_html(num) {
      var html = `<label class="image__box__label" id="input_${num}" for="display_item_images_attributes_${num}_image">
                    <div class="image__box__input-area">
                      <input class="image__box__input-area__tag" type="file" name="display_item[images_attributes][${num}][image]" id="display_item_images_attributes_${num}_image">
                      <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                    </div>
                  </label>`;
      return html
    }
    // 下段(追加)のinput作成
    function create_input_html_add(num) {
      var html = `<label class="add-image__box__label" id="input_${num}" for="display_item_images_attributes_${num}_image">
                    <div class="image__box__input-area">
                      <input class="add-image__box__input-area__tag" type="file" name="display_item[images_attributes][${num}][image]" id="display_item_images_attributes_${num}_image">
                      <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                    </div>
                  </label>`;
      return html
    }
    // プレビュー作成
    function create_preview_list(image) {
      var list = `<li class="image__box__previews__preview">
                    <div class="image__box__previews__preview__frame">
                      <img class="image__box__previews__preview__frame__image" src=${image} alt="Images?q=tbn%3aand9gctgnljfqxsx9sgf5n69hvtk1 wvfwbcatk1vpitcfmrieh3 fga">
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
    // 下段追加のhtml作成
    function create_input_area(num) {
      var html = `<div class="add-image__box">
                    <ul class="add-image__box__previews">
                      <!-- / プレビュー用のビューを差し込む -->
                    </ul>
                    <label class="add-image__box__label" id="input_${num}" for="display_item_images_attributes_${num}_image">
                      <div class="image__box__input-area">
                        <input class="add-image__box__input-area__tag" type="file" name="display_item[images_attributes][${num}][image]" id="display_item_images_attributes_${num}_image">
                        <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                      </div>
                    </label>
                  </div>`;
      return html;
    }


    $(document).on('change', '.image__box__input-area__tag', function(e) {
      // 同名クラス名を取得
      var obj = document.querySelectorAll(".image__box__label");
      var num = obj.length;

      // 入力済みのinputを非表示に
      var name = "input_" + String(num-1);
      $('#' + name).css('display','none');

      if (num < 5) {
      // inputのhtml作成
      var html = create_input_html(num);
      $('.image__box').append(html);
      }

      // プレビュー表示用の処理
      var reader = new FileReader();
      reader.onload = function (e) {
        //// listのhtml作成
        var list = create_preview_list(e.target.result);
        $('.image__box__previews').append(list);
      }
      reader.readAsDataURL(e.target.files[0]);

      // 5個目のインプットエリアを非表示に
      if (num == 5) {
        $("#input_5").css('display','none');
        var add_input_area = create_input_area(5);
        $('.image').append(add_input_area);
      }

    })


    $(document).on('change', '.add-image__box__input-area__tag', function(e) {
      // 同名クラス名を取得
      var obj = document.querySelectorAll(".add-image__box__label");
      var num = obj.length;

      // 入力済みのinputを非表示に
      var name = "input_" + String(num+4);
      $('#' + name).css('display','none');

      if (num < 5) {
      // inputのhtml作成
      var html = create_input_html_add(num+5);
      $('.add-image__box').append(html);
      }

      // プレビュー表示用の処理
      var reader = new FileReader();
      reader.onload = function (e) {
        //// listのhtml作成
        var list = create_preview_list(e.target.result);
        $('.add-image__box__previews').append(list);
      }
      reader.readAsDataURL(e.target.files[0]);

      // 5個目のインプットエリアを非表示に
      if (num == 5) {
        $("#input_5").css('display','none');
      }

    })
});