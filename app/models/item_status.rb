class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '納品済み' },
    { id: 3, name: '取り寄せ必要' },
    { id: 4, name: '欠品中' },
    { id: 5, name: 'サンプル' },
    { id: 6, name: '納品待ち' },
    { id: 7, name: '廃盤' },
    { id: 8, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end