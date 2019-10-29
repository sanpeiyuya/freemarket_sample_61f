# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   coding: utf-8

# brandsテーブルのレコード追加
Brand.all.destroy_all # まず全レコード削除
Brand.create(name: "NIKE")
Brand.create(name: "adidas")
Brand.create(name: "PUMA")
Brand.create(name: "RALPH LAUREN")

# sizeテーブルのレコード追加
Size.all.destroy_all # まず全レコード削除
## SML
sml = Size.create(size: "SML")
children.create(size: "XXS以下")
children.create(size: "XS(SS)")
children.create(size: "S")
children.create(size: "M")
children.create(size: "L")
children.create(size: "XL(LL)")
children.create(size: "2XL(3L)")
children.create(size: "3XL(4L)")
children.create(size: "4XL(5L)")
children.create(size: "FREE SIZE")
## メンズ靴サイズ(cm)
mens = Size.create(size: "shoes(mens)")
mens.children.create(size: "23.5cm以下")
mens.children.create(size: "24cm")
mens.children.create(size: "24.5cm")
mens.children.create(size: "25cm")
mens.children.create(size: "25.5cm")
mens.children.create(size: "26cm")
mens.children.create(size: "26.5cm")
mens.children.create(size: "27cm")
mens.children.create(size: "27.5cm")
mens.children.create(size: "28cm")
mens.children.create(size: "28.5cm")
mens.children.create(size: "29cm")
mens.children.create(size: "29.5cm")
mens.children.create(size: "30cm")
mens.children.create(size: "30.5cm")
mens.children.create(size: "31cm以上")
## レディース靴サイズ(cm)
ladies = Size.create(size: "shoes(ladies)")
ladies.children.create(size: "20cm以下")
ladies.children.create(size: "20.5cm")
ladies.children.create(size: "21cm")
ladies.children.create(size: "21.5cm")
ladies.children.create(size: "22cm")
ladies.children.create(size: "22.5cm")
ladies.children.create(size: "23cm")
ladies.children.create(size: "23.5cm")
ladies.children.create(size: "24cm")
ladies.children.create(size: "24.5cm")
ladies.children.create(size: "25cm")
ladies.children.create(size: "25.5cm")
ladies.children.create(size: "26cm")
ladies.children.create(size: "26.5cm")
ladies.children.create(size: "27cm")
ladies.children.create(size: "27.5cm以上")
## ベビー・キッズ用品サイズ(~95cm)
kids_small = Size.create(size: "kids(samll)")
kids_small.children.create(size: "60cm")
kids_small.children.create(size: "70cm")
kids_small.children.create(size: "80cm")
kids_small.children.create(size: "90cm")
kids_small.children.create(size: "95cm")
## ベビー・キッズ用品サイズ(100cm)~
kids_big = Size.create(size: "kids(big)")
kids_big.children.create(size: "100cm")
kids_big.children.create(size: "110cm")
kids_big.children.create(size: "120cm")
kids_big.children.create(size: "130cm")
kids_big.children.create(size: "140cm")
kids_big.children.create(size: "150cm")
kids_big.children.create(size: "160cm")
## ベビー・キッズ用靴
kid_shoes = Size.create(size: "shoes(kids)")
kid_shoes.children.create(size: "10.5cm以下")
kid_shoes.children.create(size: "11cm")
kid_shoes.children.create(size: "11.5cm")
kid_shoes.children.create(size: "12cm")
kid_shoes.children.create(size: "12.5cm")
kid_shoes.children.create(size: "13cm")
kid_shoes.children.create(size: "13.5cm")
kid_shoes.children.create(size: "14cm")
kid_shoes.children.create(size: "14.5cm")
kid_shoes.children.create(size: "15cm")
kid_shoes.children.create(size: "15.5cm")
kid_shoes.children.create(size: "16cm")
kid_shoes.children.create(size: "16.5cm")
kid_shoes.children.create(size: "17cm以上")
## テレビ
tv = Size.create(size: "〜20インチ")
tv.children.create(size: "20〜26インチ")
tv.children.create(size: "26〜32インチ")
tv.children.create(size: "32〜37インチ")
tv.children.create(size: "37〜40インチ")
tv.children.create(size: "40〜42インチ")
tv.children.create(size: "42〜46インチ")
tv.children.create(size: "46〜52インチ")
tv.children.create(size: "52〜60インチ")
tv.children.create(size: "61インチ〜")
## 自動車タイヤ/ホイール
tire = Size.create(size: "tire")
tire.children.create(size: "12インチ");
tire.children.create(size: "13インチ");
tire.children.create(size: "14インチ");
tire.children.create(size: "15インチ");
tire.children.create(size: "16インチ");
tire.children.create(size: "17インチ");
tire.children.create(size: "18インチ");
tire.children.create(size: "19インチ");
tire.children.create(size: "20インチ");
tire.children.create(size: "21インチ");
tire.children.create(size: "22インチ");
tire.children.create(size: "23インチ");
tire.children.create(size: "24インチ");
## ボードサイズ
board = Size.create(size: "board")
board.children.create(size: "135cm〜140cm未満")
board.children.create(size: "140cm〜145cm未満")
board.children.create(size: "145cm〜150cm未満")
board.children.create(size: "150cm〜155cm未満")
board.children.create(size: "155cm〜160cm未満")
board.children.create(size: "160cm〜165cm未満")
board.children.create(size: "165cm〜170cm未満")


# categoriesテーブルのレコード追加
