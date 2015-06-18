# movies = [['Alfonso Cuaron', 'Gravity'], ['Spike Jonze', 'Her'], ['Martin Scorsese', 'The Wolf of Wall Street']]

# puts movies.to_h
# h = movies.inject {|key, value| key + value }


# h = movies.inject({}) { |r, i|}
# r[i.first] = i.last
# r
# end




array = %w(black tea, green tea, yerba mate, oolong, gyokoru).inject do |tea, word|
   tea.length > word.length ? tea : word
end

puts array

array = %w(black tea, green tea, yerba mate, oolong, gyokoru)

array.each do |key, value|
    if key.length > value.length
        then key : value
    end