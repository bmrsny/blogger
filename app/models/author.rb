class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, meassage: "should match confirmation"
end
