module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |el| el > max ? max = el : max }
        array.map! { |el| el.positive? ? max : el }
      end

      def search(array, query)
        low = 0
        high = array.length - 1
        mid = array.length / 2
        while low <= high
          if array[mid] < query
            low = mid + 1
          elsif array[mid] > query
            high = mid - 1
          end
          mid = low + (high - low) / 2
          return mid if array[mid] == query
        end
        -1
      end
    end
  end
end
