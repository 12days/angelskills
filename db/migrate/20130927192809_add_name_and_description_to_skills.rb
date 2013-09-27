class AddNameAndDescriptionToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :name, :string
    add_column :skills, :description, :string

    add_column :created_at, :datetime
    add_column :updated_at, :datetime
  end
end
