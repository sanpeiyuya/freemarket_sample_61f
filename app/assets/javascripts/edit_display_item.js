$(function() {

  var pathname = window.location.pathname;
  if (/display_items.\d+.edit/.test(pathname)) {
    console.log("hello");

    function create_width() {
      var lists = document.getElementsByClassName('image__box__preview');
      switch(lists.length) {
        case 1:
        case 6:
          var width = '500px'
          break;
        case 2:
        case 7:
          var width = '380px'
          break;
        case 3:
        case 8:
          var width = '260px'
          break;
        case 4:
        case 9:
          var width = '140px'
          break;
        case 5:
        case 10:
          var width = '620px'
          break;
      }
      return width;
    }

    function create_display_label(i) {
      var width = create_width();
      var html = `<label style="width:${width};" class="image__box__label active-display" id="${i}" for="display_item_images_attributes_${i}_image">
                    <div class="image__box__input-area">
                      <input accept="image/*" class="image__box__input-area__tag" type="file" name="display_item[images_attributes][${i}][image]" id="display_item_images_attributes_${i}_image">
                      <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                    </div>
                  </label>`;
      return html
    }

    function create_display_none_label(i) {
      var html = `<label style="display:none;" class="image__box__label" id="${i}" for="display_item_images_attributes_${i}_image">
                    <div class="image__box__input-area">
                      <input accept="image/*" class="image__box__input-area__tag" type="file" name="display_item[images_attributes][${i}][image]" id="display_item_images_attributes_${i}_image">
                      <p class="image__box__input-area__tips">ドラッグアンドドロップ<br>またはクリックしてファイルをアップデート</p>
                    </div>
                  </label>`;
      return html
    }

    function delete_image_id(image_id) {
      var html = `<input type="checkbox" style="display: none;" checked="true" value="1" name="display_item[images_attributes][${image_id}][_destroy]" id="display_item_images_attributes_${image_id}__destroy">
                  <input type="hidden" value="${image_id}" name="display_item[images_attributes][${image_id}][id]" id="display_item_images_attributes_${image_id}_id">`;
      return html;
    }
  
  
    // ページ遷移時に実行、不要なインプットエリアを削除
    $('.image__box__label').remove();
    for (  var i = 0;  i < 10;  i++  ) {
      var remove_ele = "#display_item_images_attributes_"+ i +"_id";
      $(remove_ele).remove();
    }
    // ページ遷移時に実行、新しいinputエリアを取り付け
    var previews = document.getElementsByClassName('image__box__preview');
    if ( previews.length < 10 ) {
      for ( var i = 0;  i <= (9 - previews.length);  i++ ) {
        if (i == 0) {
          var html = create_display_label(i);
          $('.image__box').append(html);
        } else {
          var html = create_display_none_label(i);
          $('.image__box').append(html);
        }
      }
    }
    
    // プレビューが消されたら、deleteするimage_idを取得
    $('.edit-delete-preview').on('click', function() {
      var preview_box = $(this).parent().parent();
      var image_id = $(preview_box).attr('id');
  
      var html = delete_image_id(image_id);
      $('.delete_image_id_box').append(html);
  
      $(preview_box).remove();
    });
   
  }
});