#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blog dos Tabajaras"
    xml.author "IFPB"
    xml.description "Artigos sobre tecnologia"
    xml.link "localhost"
    xml.language "pt-BR"

    for article in @articles
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "IFPB"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid article.id
        xml.description simple_format(article.text)

      end
    end
  end
end
