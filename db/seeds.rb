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
xxs = sml.children.create(size: "XXS以下")
xs = sml.children.create(size: "XS(SS)")
s = sml.children.create(size: "S")
m = sml.children.create(size: "M")
l = sml.children.create(size: "L")
xl = sml.children.create(size: "XL(LL)")
xxl = sml.children.create(size: "2XL(3L)")
xxxl = sml.children.create(size: "3XL(4L)")
xxxxl = sml.children.create(size: "4XL(5L)")
free_size = sml.children.create(size: "FREE SIZE")
## メンズ靴サイズ(cm)
mens = Size.create(size: "shoes(mens)")
mens_23h = mens.children.create(size: "23.5cm以下")
mens_24 = mens.children.create(size: "24cm")
mens_24h = mens.children.create(size: "24.5cm")
mens_25 = mens.children.create(size: "25cm")
mens_25h = mens.children.create(size: "25.5cm")
mens_26 = mens.children.create(size: "26cm")
mens_26h = mens.children.create(size: "26.5cm")
mens_27 = mens.children.create(size: "27cm")
mens_27h = mens.children.create(size: "27.5cm")
mens_28 = mens.children.create(size: "28cm")
mens_28h = mens.children.create(size: "28.5cm")
mens_29 = mens.children.create(size: "29cm")
mens_29h = mens.children.create(size: "29.5cm")
mens_30 = mens.children.create(size: "30cm")
mens_30h = mens.children.create(size: "30.5cm")
mens_31 = mens.children.create(size: "31cm以上")
## レディース靴サイズ(cm)
ladies = Size.create(size: "shoes(ladies)")
ladies_20 = ladies.children.create(size: "20cm以下")
ladies_20h = ladies.children.create(size: "20.5cm")
ladies_21 = ladies.children.create(size: "21cm")
ladies_21h = ladies.children.create(size: "21.5cm")
ladies_22 = ladies.children.create(size: "22cm")
ladies_22h = ladies.children.create(size: "22.5cm")
ladies_23 = ladies.children.create(size: "23cm")
ladies_23h = ladies.children.create(size: "23.5cm")
ladies_24 = ladies.children.create(size: "24cm")
ladies_24h = ladies.children.create(size: "24.5cm")
ladies_25 = ladies.children.create(size: "25cm")
ladies_25h = ladies.children.create(size: "25.5cm")
ladies_26 = ladies.children.create(size: "26cm")
ladies_26h = ladies.children.create(size: "26.5cm")
ladies_27 = ladies.children.create(size: "27cm")
ladies_27h = ladies.children.create(size: "27.5cm以上")
## ベビー・キッズ用品サイズ(~95cm)
kids_small = Size.create(size: "kids(samll)")
kids_60 = kids_small.children.create(size: "60cm")
kids_70 = kids_small.children.create(size: "70cm")
kids_80 = kids_small.children.create(size: "80cm")
kids_90 = kids_small.children.create(size: "90cm")
kids_95 = kids_small.children.create(size: "95cm")
## ベビー・キッズ用品サイズ(100cm)~
kids_big = Size.create(size: "kids(big)")
kids_100 = kids_big.children.create(size: "100cm")
kids_110 = kids_big.children.create(size: "110cm")
kids_120 = kids_big.children.create(size: "120cm")
kids_130 = kids_big.children.create(size: "130cm")
kids_140 = kids_big.children.create(size: "140cm")
kids_150 = kids_big.children.create(size: "150cm")
kids_160 = kids_big.children.create(size: "160cm")
## ベビー・キッズ用靴
kid_shoes = Size.create(size: "shoes(kids)")
kids_shoes_10h = kid_shoes.children.create(size: "10.5cm以下")
kids_shoes_11 = kid_shoes.children.create(size: "11cm")
kids_shoes_11h = kid_shoes.children.create(size: "11.5cm")
kids_shoes_12 = kid_shoes.children.create(size: "12cm")
kids_shoes_12h = kid_shoes.children.create(size: "12.5cm")
kids_shoes_13 = kid_shoes.children.create(size: "13cm")
kids_shoes_13h = kid_shoes.children.create(size: "13.5cm")
kids_shoes_14 = kid_shoes.children.create(size: "14cm")
kids_shoes_14h = kid_shoes.children.create(size: "14.5cm")
kids_shoes_15 = kid_shoes.children.create(size: "15cm")
kids_shoes_15h = kid_shoes.children.create(size: "15.5cm")
kids_shoes_16 = kid_shoes.children.create(size: "16cm")
kids_shoes_16h = kid_shoes.children.create(size: "16.5cm")
kids_shoes_17 = kid_shoes.children.create(size: "17cm以上")
## テレビ
tv = Size.create(size: "〜20インチ")
tv26 = tv.children.create(size: "20〜26インチ")
tv32 = tv.children.create(size: "26〜32インチ")
tv37 = tv.children.create(size: "32〜37インチ")
tv40 = tv.children.create(size: "37〜40インチ")
tv42 = tv.children.create(size: "40〜42インチ")
tv46 = tv.children.create(size: "42〜46インチ")
tv52 = tv.children.create(size: "46〜52インチ")
tv60 = tv.children.create(size: "52〜60インチ")
tv61 = tv.children.create(size: "61インチ〜")
## 自動車タイヤ/ホイール
tire = Size.create(size: "tire")
tire_12 = tire.children.create(size: "12インチ");
tire_13 = tire.children.create(size: "13インチ");
tire_14 = tire.children.create(size: "14インチ");
tire_15 = tire.children.create(size: "15インチ");
tire_16 = tire.children.create(size: "16インチ");
tire_17 = tire.children.create(size: "17インチ");
tire_18 = tire.children.create(size: "18インチ");
tire_19 = tire.children.create(size: "19インチ");
tire_20 = tire.children.create(size: "20インチ");
tire_21 = tire.children.create(size: "21インチ");
tire_22 = tire.children.create(size: "22インチ");
tire_23 = tire.children.create(size: "23インチ");
tire_24 = tire.children.create(size: "24インチ");
## ボードサイズ
board = Size.create(size: "board")
board_140 = board.children.create(size: "135cm〜140cm未満")
board_145 = board.children.create(size: "140cm〜145cm未満")
board_150 = board.children.create(size: "145cm〜150cm未満")
board_155 = board.children.create(size: "150cm〜155cm未満")
board_160 = board.children.create(size: "155cm〜160cm未満")
board_165 = board.children.create(size: "160cm〜165cm未満")
board_170 = board.children.create(size: "165cm〜170cm未満")