POSTを意識する必要は無いはずなので
基本全てGETです。

(/?longitude=xxx&latitude=xxx)がついているものは緯度経度で検索した結果を返す。  
つけなかった場合はすべてのデータを無条件で返します。  

  
/api/shops(/?longitude=xxx&latitude=xxx)  
shopsの一覧をjsonで  
  
/api/shops/<:id>  
id番目のshopを表示をjson  
  
/api/shops/<:id>/files  
id番目のshopの持ってるfileの一覧をjson  
  
/api/files(/?longitude=xxx&latitude=xxx)
ファイルの一覧をjsonで返す  

/companies(.json)  
登録している会社の一覧(json化する)  
  
/companies/new  
新しい会社を登録するフォームを表示  
  
/companies/<:company_id>(.json)  
company_id番の会社を表示(json化する)  
  
/companies/<:company_id>/shops(.json)  
指定会社が所持しているshopの一覧(jsonも)  
  
/companies/<:company_id>/shops/new  
指定会社が所持するshopの登録フォームを表示  
  
shops/<:shop_id>(.json)  
ショップを表示(json)  
  
shops/<:shop_id>/files(.json)  
ショップの持っているfileの一覧(json)  
  
shops/<:shop_id>/files/new  
察しのとおりだと思います。  
  
files/<:file_id>(.json)  
察しのとおりです。  
  
  
