$(function() {

  function create_list(image) {
    var list = `<div class="image__box__preview">
                  <div class="image__box__preview__frame">
                    <img class="image__box__preview__frame__image" src="${image}">
                  </div>
                  <div class="image__box__preview__btns">
                    <div class="image__box__preview__btns__btn">
                      編集
                    </div>
                    <div class="image__box__preview__btns__btn">
                      削除
                    </div>
                  </div>
                </div>`;
    return list;
  };


  $(document).on('change', '.image__box__input-area__tag', function(e) {

    // label要素の取得
    var label = $(this).parent().parent()
    // 入力したインプットエリアを消す
    label.css('display', 'none');

    // プレビュー表示
    var reader = new FileReader();
    reader.onload = function (e) {
      // list作成、追加
      var list = create_list(e.target.result);
      $('#0').before(list);  
    }
    reader.readAsDataURL(e.target.files[0]);


    // 次のlabelを表示し、widthを決定
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

    // 次のインプットエリアを表示
    var next_label_id = Number(label.attr('id')) + 1;
    $('#' + next_label_id).css({'display':'', 'width': width});

  });
});