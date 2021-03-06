class Post < ActiveRecord::Base
	
# ------------------------------------------------------------------------------
# Includes & Extensions
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Constants
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Attributes
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Associations
# ------------------------------------------------------------------------------

belongs_to :user

has_many :post_tags
has_many :tags, through: :post_tags, dependent: :destroy

has_attached_file :photo , url: "/system/posts/photos/:hash.:extension", hash_secret: "abc123"

# ------------------------------------------------------------------------------
# Validations
# ------------------------------------------------------------------------------

# validates_presence_of [:title, :text] , :message => "can't be empty"

validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png",  "image/jpg"] }


# ------------------------------------------------------------------------------
# Callbacks
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Nested Attributes
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Scopes
# ------------------------------------------------------------------------------

scope :ordered_by_reverse_order, -> { order('created_at DESC') }

# ------------------------------------------------------------------------------
# Other
# ------------------------------------------------------------------------------





# ------------------------------------------------------------------------------
# Class Methods
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Instance Methods
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
protected
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
private
# ------------------------------------------------------------------------------




end
