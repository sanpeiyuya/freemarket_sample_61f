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