class Project       

  include Mongoid::Document           
  include Mongoid::TaggableWithContext
  include Mongoid::TaggableWithContext::AggregationStrategy::RealTime
  include Mongo::Voteable
  include Mongoid::Slug
  include Mongoid::Search

  # set points for each vote
  voteable self, :up => +1, :down => -1
 
  belongs_to :user

  slug :name, 
    :permanent => true, # Don't change slug in the future
    :index => true
    
  field :name, :type => String
  field :description, :type => String
  field :repository, :type => String
  field :live_url, :type => String 
  taggable :libraries, :separator => ','                                                          
  search_in :name, :description 
  
def create 
  @project = Project.find_by_slug(params[:project_id])
  
   @project.user = current_user
  
end
#  scoped_order 'votes.count', 'votes.up_count', 'votes.down_count', 'votes.point'
end
