# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#   coding: utf-8

# display_itemsを全削除
DisplayItem.all.destroy_all
# brandsテーブルのレコード追加
Brand.all.destroy_all # まず全レコード削除
Brand.create(name: "ナイキ", name_alphabet: "nike", name_kana: "ないき")
Brand.create(name: "アディダス", name_alphabet: "adidas", name_kana: "あでぃだす")
Brand.create(name: "プーマ", name_alphabet: "puma", name_kana: "ぷーま")
Brand.create(name: "ポロ ラルフローレン", name_alphabet: "polo ralph lauren", name_kana: "ぽろ らるふろーれん")
Brand.create(name: "ユニクロ", name_alphabet: "uniqlo", name_kana: "ゆにくろ")
Brand.create(name: "コーチ", name_alphabet: "coach", name_kana: "こーち")
Brand.create(name: "フルラ", name_alphabet: "fulra", name_kana: "ふるら")
Brand.create(name: "グッチ", name_alphabet: "gucci", name_kana: "ぐっち")
Brand.create(name: "ロンシャン", name_alphabet: "longchamp", name_kana: "ろんしゃん")
Brand.create(name: "ティファニー", name_alphabet: "tiffany", name_kana: "てぃふぁにー")

# sizeテーブルのレコード追加
Size.all.destroy_all # まず全レコード削除
## SML
sml = Size.create(size: "SML")
sml.children.create(size: "XXS以下")
sml.children.create(size: "XS(SS)")
sml.children.create(size: "S")
sml.children.create(size: "M")
sml.children.create(size: "L")
sml.children.create(size: "XL(LL)")
sml.children.create(size: "2XL(3L)")
sml.children.create(size: "3XL(4L)")
sml.children.create(size: "4XL(5L)")
sml.children.create(size: "FREE SIZE")
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
tv = Size.create(size: "tv")
tv.children.create(size: "〜20インチ")
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
## サイズ取得
sml = Size.find_by(size: "SML").id
shoes_mens = Size.find_by(size: "shoes(mens)").id
shoes_ladies = Size.find_by(size: "shoes(ladies)").id
kids_small = Size.find_by(size: "kids(samll)").id
kids_big = Size.find_by(size: "kids(big)").id
shoes_kids = Size.find_by(size: "shoes(kids)").id
tv = Size.find_by(size: "tv").id
tire = Size.find_by(size: "tire").id
board = Size.find_by(size: "board").id

Category.all.destroy_all # まず全レコード削除

## レディース
ladies = Category.create(name: "レディース")
ladies_tops = ladies.children.create(name: "トップス")
ladies_outer = ladies.children.create(name: "ジャケット/アウター")
ladies_pants = ladies.children.create(name: "パンツ")
ladies_tops.children.create(size_id: sml, name: "Tシャツ/カットソー(半袖/袖なし)", brand: 1)
ladies_tops.children.create(size_id: sml, name: "Tシャツ/カットソー(七分/長袖)", brand: 1)
ladies_tops.children.create(size_id: sml, name: "シャツ/ブラウス(半袖/袖なし)", brand: 1)
ladies_tops.children.create(size_id: sml, name: "シャツ/ブラウス(七分/長袖)", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ポロシャツ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "キャミソール", brand: 1)
ladies_tops.children.create(size_id: sml, name: "タンクトップ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ホルターネック", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ニット/セーター", brand: 1)
ladies_tops.children.create(size_id: sml, name: "チュニック", brand: 1)
ladies_tops.children.create(size_id: sml, name: "カーディガン/ボレロ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "アンサンブル", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ベスト/ジレ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "パーカー", brand: 1)
ladies_tops.children.create(size_id: sml, name: "トレーナー/スウェット", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ベアトップ/チューブトップ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "ジャージ", brand: 1)
ladies_tops.children.create(size_id: sml, name: "その他", brand: 1)
ladies_outer.children.create(size_id: sml, name: "テラードジャケット", brand: 1)
ladies_outer.children.create(size_id: sml, name: "ノーカラードジャケット", brand: 1)
ladies_pants.children.create(size_id: sml, name: "デニム/ジーンズ", brand: 1)
ladies_pants.children.create(size_id: sml, name: "ショートパンツ", brand: 1)
## メンズ
mens = Category.create(name: "メンズ")
mens_tops = mens.children.create(name: "トップス")
mens_tops.children.create(size_id: sml, name: "Tシャツ/カットソー(半袖/袖なし)", brand: 1)
## ベビー・キッズ
kids = Category.create(name: "ベビー・キッズ")
kids_BabyGirls_under95 = kids.children.create(name: "ベビー服(女の子用)~95cm")
kids_BabyGirls_under95.children.create(size_id: kids_small, name: "トップス", brand: 1)
## インテリア・住まい・小物
interiors = Category.create(name: "インテリア・住まい・小物")
interiors_kichen = interiors.children.create(name: "キッチン/食器")
interiors_kichen.children.create(name: "食器", brand: 1)
## 本・音楽・ゲーム
subcals = Category.create(name: "本・音楽・ゲーム")
subcals_books = subcals.children.create(name: "本")
subcals_books.children.create(name: "文学/小説")
## おもちゃ・ホビー・グッズ
hobbies = Category.create(name: "おもちゃ・ホビー・グッズ")
hobbies_toys = hobbies.children.create(name: "おもちゃ")
hobbies_toys.children.create(name: "キャラクターグッズ")
## コスメ・香水・美容
beaties = Category.create(name: "コスメ・香水・美容")
beaties_cosmetics = beaties.children.create(name: "ベースメイク")
beaties_cosmetics.children.create(name: "ファンデーション", brand: 1)
## 家電・スマホ・カメラ
electrics = Category.create(name: "家電・スマホ・カメラ")
electrics_phones = electrics.children.create(name: "スマートフォン/携帯電話")
electrics_phones.children.create(name: "スマートフォン本体", brand: 1)
## スポーツ・レジャー
spots = Category.create(name: "スポーツ・レジャー")
spots_board = spots.children.create(name: "スノーボード")
spots_board.children.create(size_id: board, name: "ボード", brand: 1)
## ハンドメイド
handmades = Category.create(name: "ハンドメイド")
handmades_accessories = handmades.children.create(name: "アクセサリー(女性用)")
handmades_accessories.children.create(name: "ピアス")
## チケット
tickets = Category.create(name: "チケット")
tickets_music = tickets.children.create(name: "音楽")
tickets_music.children.create(name: "男性アイドル")
## 自動車・オートバイ
cars = Category.create(name: "自動車・オートバイ")
cars_tires = cars.children.create(name: "自動車タイヤ/ホイール")
cars_tires.children.create(size_id: tire, name: "タイヤ/ホイールセット", brand: 1)
## その他
etceteras = Category.create(name: "その他")
etceteras.children.create(name: "まとめ売り")
