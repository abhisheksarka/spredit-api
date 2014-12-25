class Conversation < ActiveRecord::Base
  belongs_to :conversable, polymorphic: true
  validates :title, :presence => true

  def self.categories
    {
      :everyday => [
        'Art, Design and Photography',
        'Style and Fashion',
        'Music, Books and TV',
        'Places and Travel',
        'Relationships',
        'Sports',
        'Hobbies'
      ],
      :fun => [
        'Humor',
        'Random',
        'NSFW'
      ],
      :serious => [
        'Politics',
        'Science and Technology',
        'Education and Career',
        'Business and Finance',
        'Books and Literature'
      ],
      :live => [
        'Event'
      ]
    }
  end
end
