class Agency < ApplicationRecord
  enum grade: [ :padawan, :jedi, :master ]
end
