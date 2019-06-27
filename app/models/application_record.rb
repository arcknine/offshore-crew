class ApplicationRecord < ActiveRecord::Base
  extend ApplicationHelper
  
  self.abstract_class = true
end
