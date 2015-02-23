class Title

  ###
  # The generate function rolls two random dice
  # - length:
  #     Either 2 or 3, determines whether the title will have
  #     an adjective (3) or not (2) in between its prefix and noun
  # - type:
  #     1 -> Singular Prefix
  #     2 -> Plural Prefix
  #     3 -> No Prefix
  ###
  def self.generate
    length = rand(2..3)
    type = rand(1..3)
    if type == 1  # Singular Prefix + (Adj) + Noun
      case length
        when 2
          a_to_an(singular_prefix + ' ' + noun)
        when 3
          a_to_an(singular_prefix + ' ' + adjective + ' ' + noun)
      end
    elsif type == 2 # Plural Prefix + (Adj) + Noun
      case length
        when 2
          a_to_an(plural_prefix + ' ' + noun.pluralize)
        when 3
          a_to_an(plural_prefix + ' ' + adjective + ' ' + noun.pluralize)
      end
    else #type == 3 # Adj + Noun
      a_to_an(adjective + ' ' + noun.pluralize)
    end
  end

  private

  ###
  # Prefixes for singular nouns
  #
  # - Many of these should end in the word 'A'
  #     'Life Without A New President' vs 'Life Without New President'
  # - Possessives work well here
  #     'His', 'Her', 'Their', etc.
  ###

  def self.singular_prefix
    ['His', 'Her', 'Their', 'One', 'Our', 'Life Without A', 'Everybody Loves A', 'You, Me, and A',
     'Adventures of A', 'Why Not A', 'Stories From A'].sample
  end

  ###
  # Prefixes for pluralized nouns later.
  #
  # - Avoid ending with the word 'The' unless absolutely necessary
  #     'Everybody Loves' is preferred to 'Everybody Loves The'
  #     'The' and 'You, Me and The' are good examples of necessary uses of 'The'
  ###

  def self.plural_prefix
    ['The', 'Two', 'Two and a Half', 'Three', 'A House Full of', 'You, Me and The',
     'The King of', 'Too Many', 'Everybody Loves', 'Life Without',
     'Not Enough', 'Living With'].sample
  end

  ###
  # Adjectives to describe the subject of the sitcom.
  #
  # - Avoid using the following types of words
  #     Colors   : 'Blue', 'Red', 'Periwinkle'
  #     Extremes : 'Worst', 'Funniest', 'Most Amazing'
  ###

  def self.adjective
    ['Lonely', 'Confused', 'New', 'Old', 'Amazing', 'Unstable', 'Strange',
     'Odd', 'Wonderful', 'All-American', 'Amish', 'Straight', 'Gay', 'French',
     'Terrible', 'Funny', 'Young', 'Smart', 'Modern'].sample
  end

  ###
  # Nouns
  #
  # - Types of people work well here
  #     'Pope', 'Uncle'
  # - Animals as well
  #     'Horse', 'Cat', 'Dog'
  # - Locations are okay, but should be used sparingly.
  #     'City', 'Town', 'Farm'
  ###

  def self.noun
    ['Man', 'Woman', 'Girl', 'Boy', 'Family', 'Pope',
     'President', 'Fresh Prince', 'City', 'Town', 'Church',
     'Dog', 'Cat', 'Horse', 'Farm', 'House', 'Batchelor', 'Batchelorette',
     'Friend', 'Co-worker', 'In-Law', 'Plumber', 'Brother',
     'Sister', 'Mom', 'Dad', 'Doctor', 'Pastor', 'Hero'].sample
  end

  def self.a_to_an(string)
    string.scan(/A [AEIOU]/).each do |occurance|
      string.sub!(/A [AEIOU]/, 'An ' + occurance[2])
    end
    string
  end

end