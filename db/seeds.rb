# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  
Tag.create!([
  { name: '映画' },
  { name: 'ドラマ' },
  { name: 'アニメ' },
  { name: 'ゲーム' },
  { name: '本' },
  { name: 'かわいい' },
  { name: 'こわい' },
  { name: '恋愛' },
  { name: 'コメディ' },
  { name: 'ホラー' },
  { name: 'アクション' },
  { name: '青春' },
  { name: '短時間' },
  { name: '長時間' },
  { name: 'スマホアプリ' },
  { name: '30〜1時間' },
  { name: '1時間以上' },
  { name: 'ブラフ'},
  { name: '正体隠匿'},
  { name: 'タイル配置'},
  { name: '拡大再生産'},
  { name: 'ドラフト'},
  { name: 'ワーカープレイスメント'},
  { name: '陣取り'},
  { name: 'デッキ構築'},
  { name: '競り'},
  { name: '協力'},
  { name: '表現'},
])