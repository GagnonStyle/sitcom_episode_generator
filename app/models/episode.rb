class Episode

  def self.generate_number
    rand(1..7)*100 + rand(1..30)
  end

  def self.generate_desc(characters)
    count = characters.length

    count = 4 if count > 4 #We don't support more than 4 characters per episode currently

    characters.shuffle!

    desc = [desc_main_plot, desc_sub_plot].join
    star_count = desc.scan('$STAR$').size
    (1..star_count).each do |i|
      desc.sub! '$STAR$', characters[i-1]
    end
    # desc = characters[0] + ' and ' + characters[1] +  ' ' + action + ' ' + item

    desc
  end

  private

  def self.desc_main_plot
    ['$STAR$ and $STAR$ win a hundred dollars on a scratch ticket',
     '$STAR$ has to retake their driving test',
     '$STAR$\'s hometown little league team makes it to the world series',
     '$STAR$ and $STAR$ get an unexpected visitor',
     '$STAR$ goes on their first date with $STAR$',
     'An unexpected power outage brings $STAR$ and $STAR$ closer than ever'].sample
  end

  def self.desc_sub_plot
    [', and $STAR$ tries to rescue all the puppies from the local pound.',
     ', and $STAR$ rear-ends the landlord in the parking garage.',
     ', causing $STAR$ to set up a nuclear bunker in the basement.',
     ', and $STAR$\'s dog runs away.',
     ' while $STAR$\'s favorite annual barbeque gets rained out',
     ', and $STAR$ refuses to talk to anyone about it.',
     ', causing $STAR$ to be extremely jealous.',
     ', and $STAR$ is conflicted about giving money to the drunk outside the apartment',
     ', and $STAR$ does everything they can to ruin it.'].sample
  end

  def self.item
    ['a hundred dollars on a scratch ticket',
     'an adorable kittten',
     'a brand new car',
     'a huge new bed'].sample
  end

  def self.action
    ['forget', 'remember', 'eat', 'wait'].sample
  end
end