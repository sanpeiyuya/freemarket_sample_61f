$(function() {
  $(document).on('turbolinks:load', function () {
    
  // タブの切り替え
  $(function() {
    let tabs = $(".mypage__main__notice-todo__tab li");
    tabsAry = Array.prototype.slice.call(tabs);
    function tabSwitch() {
      $(".active").removeClass("active");
      $(this).addClass("active");
      const index = tabs.index(this);
      $(".mypage__main__notice-todo__tab__content li").removeClass("show").eq(index).addClass("show")
    }
    tabs.click(tabSwitch);
  });

  $(function() {
    let tabs = $(".mypage__main__item__tab li");
    tabsAry = Array.prototype.slice.call(tabs);
    function tabSwitch() {
      $(".actives").removeClass("actives");
      $(this).addClass("actives");
      const index = tabs.index(this);
      $(".mypage__main__item__tab__content li").removeClass("shows").eq(index).addClass("shows")
    }
    tabs.click(tabSwitch);
  });

  // 現在のページの見た目を変化させる
  $(function() {
    $('.mypage__side-bar__list-item').each(function(){
        var href = $(this).attr('href');
        if(location.pathname === href) {
            $(this).parent().addClass('current');
        } else {
            $(this).parent().removeClass('current');
        }
    });
  });
});
});