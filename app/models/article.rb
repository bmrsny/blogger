class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :attachments

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    #split tags into array of strings with whitespace removed
    #look for a tag object with that name, if none create it
    #add the tag object to a list of tags for the articles

    #set the article's tags to the list of tags we have found or created
  tag_names = tags_string.split(",").map { |s| s.strip.downcase }.uniq
  new_or_found_tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
  end
end
