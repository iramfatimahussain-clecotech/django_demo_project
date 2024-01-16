class Movie < ApplicationRecord
    scope :search_by_title, -> (title) { where('title LIKE ?', "%#{title}%")}

end
