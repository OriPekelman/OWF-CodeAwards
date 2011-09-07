class Project
  include Mongoid::Document           
  include Mongoid::Taggable
  field :name, :type => String
  field :description, :type => String
  field :libraries, :type => String
  field :repository, :type => String
  field :live_url, :type => String
end
