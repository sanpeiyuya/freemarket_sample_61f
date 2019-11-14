class DeliveryMethod < ActiveHash::Base
  #type:1 = 送料込み（出品者負担）だけで表示
  #type:2 = 着払い（購入者負担）だけで表示
  #type:3 = 両方で表示
  self.data = [
      {id: 1, type: 3, name: '未定'}, 
      {id: 2, type: 1, name: 'らくらくメルカリ便'}, 
      {id: 3, type: 1, name: 'レターパック'},
      {id: 4, type: 1, name: '普通郵便(定形、定形外)'}, 
      {id: 5, type: 3, name: 'クロネコヤマト'}, 
      {id: 6, type: 1, name: 'クリックポスト'}, 
      {id: 7, type: 3, name: 'ゆうメール'}, 
      {id: 8, type: 3, name: 'ゆうパック'}, 
      {id: 9, type: 1, name: 'ゆうパケット'}
  ]
end