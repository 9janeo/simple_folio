class Section < ApplicationRecord
    
    belongs_to :pages
    has_many :section_edits, :class_name => 'SectionEdit'
    has_many :admin_users, :through => :section_edits
    
end
