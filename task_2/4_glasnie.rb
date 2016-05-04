hash = ('а'..'я').zip(1..36).to_h
vowels = 'аеёиоуэюя'
hash.select! { |letter, _number| vowels.include?(letter) }