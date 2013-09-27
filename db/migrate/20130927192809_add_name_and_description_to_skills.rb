class AddNameAndDescriptionToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :name, :string
    add_column :skills, :description, :string
  end
end
