$(function() {

  function create_list(image, num) {
    var list = `<div class="image__box__preview" id="preview_${num}">
                  <div class="image__box__preview__frame">
                    <img class="image__box__preview__frame__image" src="${image}">
                  </div>
                  <div class="image__box__preview__btns">
                    <div class="image__box__preview__btns__btn">
                      編集
                    </div>
                    <div class="image__box__preview__btns__btn delete-preview">
                      削除
                    </div>
                  </div>
                </div>`;
    return list;
  };

  function create_width() {
    var lists = document.getElementsByClassName('image__box__preview');
    switch(lists.length) {
      case 0:
      case 5:
        var width = '500px'
        break;
      case 1:
      case 6:
        var width = '380px'
        break;
      case 2:
      case 7:
        var width = '260px'
        break;
      case 3:
      case 8:
        var width = '140px'
        break;
      case 4:
        var width = '620px'
        break;
    }
    return width;
  }

  function create_input_area(id) {
    var input_area = `<label style="display: none;" class="image__box__label" id="${id}" for="display_item_images_attributes_${id}_image">
                        <div class="image__box__input-area">
                          <input class="image__box__input-area__tag" type="file" name="display_item[images_attributes][${id}][image]" id="display_item_images_attributes_${id}_image">
                          <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                        </div>
                      </label>`
    return input_area;
  }

  $(document).on('change', '.image__box__input-area__tag', function(e) {
    // label要素の取得
    var label = $(this).parent().parent()
    // 入力したインプットエリアを消す
    label.css('display', 'none');

    // プレビュー表示
    var reader = new FileReader();
    reader.onload = function (e) {
      // list作成、追加
      var list = create_list(e.target.result, label.attr('id'));
      // 挿入位置の指定
      var input_areas = document.getElementsByClassName('image__box__label');
      var now_id = $(input_areas[0]).attr('id');
      $('#' + now_id).before(list);  
    }
    reader.readAsDataURL(e.target.files[0]);

    // 次のlabelを表示し、widthを決定
    var width = create_width();

    // 次のインプットエリアを表示
    var next_label_id = Number(label.attr('id')) + 1;
    $('#' + next_label_id).css({'display':'', 'width': width});

  });

  $(document).on('click', '.delete-preview', function() {
    // previewの本体要素を取得
    var preview = $(this).parent().parent()
    // previewの削除
    preview.remove();

    // ラベルを消すためのID取得
    var preview_id = preview.attr('id').replace('preview_','');
    // 一致するラベルを削除
    $('#' + preview_id).remove();

    //末尾に新しいインプットエリアを追加
    var labels = document.getElementsByClassName('image__box__label');
    var new_label_id = Number($(labels[labels.length - 1]).attr('id')) + 1;
    var input_area = create_input_area(new_label_id);
    $('.image__box').append(input_area);

    // var test = $('#display_item_images_attributes_0_image').val();
  })
});