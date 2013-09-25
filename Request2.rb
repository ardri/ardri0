require 'net/http'
require 'REXML/document'

def writenews (b)
  File.open("news.txt", "a") {|file| file.puts(b)}
end

uri = URI('http://news.yandex.ru/index.rss')
xml_news = Net::HTTP.get(uri)
documents = REXML::Document.new(xml_news)
link = ''
descr = ''
xpath = REXML::XPath.each(documents.root, '//item') {|e1| link = e1.get_text('link'); writenews(link); descr = e1.get_text('title'); writenews(descr)}

