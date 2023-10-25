# Without define_method

class Article
  attr_accessor :visibility, :name

  VISIBILITIES = {
      for_all: 0,
      for_members: 1
    }

  def initialize(name, visibility)
    @name = name
    @visibility = VISIBILITIES[visibility.to_sym]
  end

  def for_all?
    visibility == VISIBILITIES[:for_all]
  end

  def for_members?
    visibility == VISIBILITIES[:for_members]
  end

end

article_one = Article.new('Ruby Monkey Patch', 'for_all')
p "Article one visibile to all: #{article_one.for_all?}" # True
p "Article one visibile to members: #{article_one.for_members?}" # False

article_two = Article.new('Ruby Dynamic Method', 'for_members')
p "Article two visibile to all: #{article_two.for_all?}" # False
p "Article two visibile to members: #{article_two.for_members?}" # True