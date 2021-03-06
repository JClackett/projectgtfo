class Tag < ActiveRecord::Base

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

has_many :post_tags, dependent: :destroy
has_many :posts, through: :post_tags


# ------------------------------------------------------------------------------
# Validations
# ------------------------------------------------------------------------------

validates_presence_of [:title] , :message => "can't be nothing?"

# ------------------------------------------------------------------------------
# Callbacks
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Nested Attributes
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# Scopes
# ------------------------------------------------------------------------------



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
