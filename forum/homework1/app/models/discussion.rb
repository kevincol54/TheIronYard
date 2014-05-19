class Discussion < ActiveRecord::Base
  has_many :comments
  DISCUSSION_TYPE = ["Music",
                    "Tech",
                    "Music & Tech"]
end
