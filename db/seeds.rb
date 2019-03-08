10.times do
  article = Article.create title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraph

  rand(5).times do
    article.tags.create name: FFaker::Lorem.word
  end
end
