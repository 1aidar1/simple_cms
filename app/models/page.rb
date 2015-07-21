class Page < ActiveRecord::Base
    has_many :sections
	belongs_to :subject
end
