class Authentication
  include Mongoid::Document
  field :user_id, :type => Integer
  field :provider, :type => String
  field :uid, :type => String
  
  referenced_in :user
end
