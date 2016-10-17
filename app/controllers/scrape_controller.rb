class ScrapeController < ApplicationController
  def index
	# スクレイピング先のURL
	@url = 'https://tabelog.com/tokyo/A1304/A130401/13184186/'

	charset = nil
	@html = open(@url) do |f|
	  charset = f.charset # 文字種別を取得
	  f.read # htmlを読み込んで変数htmlに渡す
	end

	# htmlをパース(解析)してオブジェクトを生成
	doc = Nokogiri::HTML.parse(@html, nil, charset)
	

	# タイトルを表示
	@title = doc.at_css('p.mname').inner_text
	@address = doc.at_css('tr.address').at_css('p').inner_text
  end
end
