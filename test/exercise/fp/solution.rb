module Exercise
  module Fp
    class << self
      def rating(array)
        sum = 0
        filtered_array = array.select do |film|
          (film['rating_kinopoisk'].to_f != 0) &&
            (!film['country'].nil? && film['country'].include?(','))
        end
        filtered_array.each do |film|
          sum += film['rating_kinopoisk'].to_f
        end
        sum / filtered_array.length
      end

      def chars_count(films, threshold)
        char_count = 0
        filtered_films = films.select { |film| (film['rating_kinopoisk'].to_f >= threshold) }
        filtered_films.each do |film|
          char_count += film['name'].count('и')
        end
        char_count
      end
    end
  end
end
