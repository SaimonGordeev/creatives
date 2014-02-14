ThinkingSphinx::Index.define :creative, :with => :active_record do
  # fields
  indexes :title, :sortable => true
  indexes description
  indexes user.email, :as => :author, :sortable => true
  indexes chapters.body, :as => :body
  indexes comments.body, :as => :comments

  # attributes
  has user_id, created_at, updated_at
end
