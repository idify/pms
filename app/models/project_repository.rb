class ProjectRepository < ActiveRecord::Base
  #attr_accessible  :project_id
  #attr_accessible :name, :document, :remote_document_url
   validates :title,  :presence => true
   belongs_to :project
   mount_uploader :document, DocumentUploader
end
