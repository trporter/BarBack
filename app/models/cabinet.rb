class Cabinet < ActiveRecord::Base
  belongs_to :user

  def organize
    to_a
  end

end
