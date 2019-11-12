$(function() {

  function test() {
    var html = `<label class="image__box__label" id="[]" for="display_item_images_attributes_0_image">
                  <div class="image__box__input-area">
                    <input accept="image/*" class="image__box__input-area__tag" type="file" name="display_item[images_attributes][0][image]" id="display_item_images_attributes_0_image">
                    <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                  </div>
                </label>`;
    return html
  }

  function delete_image_id(image_id) {
    var html = `<span class="delete_image_id" name=${image_id}></span>`;
    return html;
  }

  function update_display_item(form_data) {
    var formData = new FormData(form_data);
    var pathname = window.location.pathname.replace('/edit', '');

    $.ajax({
      type: 'PATCH',
      url: pathname,
      data: formData,
      dataType: 'html',
      processData: false,
      contentType: false
    })
    .done(function() {
      console.log('成功');
    })
    .fail(function() {
      alert('商品の編集に失敗しました');
    })
  }


  // ページ遷移時に実行、不要なインプットエリアを削除
  $('.image__box__label').remove();
  for (  var i = 0;  i < 10;  i++  ) {
    var remove_ele = "#display_item_images_attributes_"+ i +"_id";
    $(remove_ele).remove();
  }
  // ページ遷移時に実行、新しいinputエリアを取り付け
  var html = test();
  $('.image__box').append(html);



  // プレビューが消されたら、deleteするimage_idを取得
  $('.image__box__preview__btns__btn').on('click', function() {
    var preview_box = $(this).parent().parent();
    var image_id = $(preview_box).attr('id');

    var html = delete_image_id(image_id);
    $('.delete_image_id_box').append(html);

    $(preview_box).remove();
  });



  // 送信をjsで送る
  $('.edit_display_item').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var pathname = window.location.pathname.replace('/edit', '');

    $.ajax({
      type: 'PATCH',
      url: pathname,
      data: formData,
      dataType: 'html',
      processData: false,
      contentType: false
    })
    .done(function() {
      console.log('成功');

      var delete_images = document.getElementsByClassName('delete_image_id');
      if ( delete_images.length != 0 ) {
        console.log("画像削除フェーズにはいった")
        // image_idを渡す配列
        var delete_image_ids = []

        for (  var i = 0;  i < delete_images.length;  i++  ) {
          var id = $(delete_images[i]).attr('name');
          delete_image_ids.push(id)
        }
        $.ajax({
          type: 'delete',
          url:  '/images/edit_destroy',
          data: {delete_image_ids, delete_image_ids},
          dataType: 'html'
        })
        .done(function() {
        })
        .fail(function() {
          alert('商品の編集に失敗しました');
        })
      }
    })
    .fail(function() {
      alert('商品の編集に失敗しました');
    })
  });

});