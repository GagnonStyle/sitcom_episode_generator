class Title

  def self.generate
    length = rand(2..3)
    singular = [true, false].sample
    if singular
      case length
        when 2
          Title.singular_prefix + ' ' + Title.singular_noun
        when 3
          Title.singular_prefix + ' ' + Title.adjective + ' ' + Title.singular_noun
      end
    else
      case length
        when 2
          Title.plural_prefix + ' ' + Title.plural_noun
        when 3
          Title.plural_prefix + ' ' + Title.adjective + ' ' + Title.plural_noun
      end
    end
  end

  private

  def self.singular_prefix
    ['The', 'A', 'Me, You, and The', 'Everybody Loves The', 'Life Without A'].sample
  end

  def self.plural_prefix
    ['Two', 'Two and a Half', 'Three', 'A House Full of', 'The King of', 'Too Many',
     'Not Enough'].sample
  end

  def self.adjective
    ['Lonely', 'Confused', 'New', 'Old', 'Most Amazing', 'Unstable', 'Strangest',
      'Odd', 'Wonderful'].sample
  end

  def self.singular_noun
    ['Man', 'Woman', 'Girl', 'Boy', 'Family', 'Pope',
     'President', 'Fresh Prince', 'City'].sample
  end

  def self.plural_noun
    ['Friends', 'Co-workers', 'Crazies', 'In-Laws', 'Plumbers', 'Men', 'Women',
     'Houses'].sample
  end
end