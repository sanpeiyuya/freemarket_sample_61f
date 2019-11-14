crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :display_items do
  link "出品した商品 - 出品中", display_items_mypages_path
  parent :mypage
end

crumb :trading_items do
  link "出品した商品 - 取引中", trading_items_mypages_path
  parent :mypage
end

crumb :finished_items do
  link "出品した商品 - 売却済み", finished_items_mypages_path
  parent :mypage
end

crumb :credit_card do
  link "支払い方法", credit_cards_path
  parent :mypage
end

crumb :credit_card_input do
  link "クレジットカード情報入力", new_credit_card_path
  parent :credit_card
end

crumb :user_profile do
  link "プロフィール", edit_user_profile_path
  parent :mypage
end

crumb :address do
  link "本人情報の登録", edit_address_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypages_path
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).