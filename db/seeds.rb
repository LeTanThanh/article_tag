10.times do
  Article.create title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraph
end

10.times do
  Tag.create name: FFaker::Lorem.sentence
end

tags = Tag.all.to_a
Article.all.each do |article|
  sample_tags = tags.sample rand(10)
  sample_tags.each do |tag|
    article.tags << tag
  end
end
