class DeliveryMethod < ActiveHash::Base
  self.data = [
      {id: 1, name: '未定'}, {id: 2, name: 'らくらくメルカリ便'}, {id: 3, name: 'レターパック'},
      {id: 4, name: '普通郵便(定形、定形外)'}, {id: 5, name: 'クロネコヤマト'}, {id: 6, name: 'クリックポスト'}, 
      {id: 7, name: 'ゆうメール'}, {id: 8, name: 'ゆうパック'}, {id: 9, name: 'ゆうパケット'}
  ]
end