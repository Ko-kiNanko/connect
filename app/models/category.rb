class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カテーテル' },
    { id: 3, name: 'ワイヤー' },
    { id: 4, name: 'バルーン' },
    { id: 5, name: 'ステント' },
    { id: 6, name: 'アテレクトミー' },
    { id: 7, name: 'マイクロカテーテル' },
    { id: 8, name: 'ガイドエクステンション' },
    { id: 9, name: 'ガイドカテーテル' },
    { id: 10, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end