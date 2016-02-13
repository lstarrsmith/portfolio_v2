class ChangeCategoryProjectText < ActiveRecord::Migration
  def up
    # simple and straightforward
    change_column :categories, :project_text, :text
  end

  # but why cant it just be:
  #   change_column :category, :project_text, :string
  # ???
  # because effin databases don't like you, that's why.
  def down
  
    # create a temporary column to hold the truncated values
    # we'll rename this later to the original column name
    add_column :categories, :temp_project_text, :string
    
    # use #find_each to load only part of the table into memory
    Category.find_each do |category|
      temp_project_text = category.project_text
      
      # test if the new value will fit into the truncated field
      if category.project_text && category.project_text.length > 255
        temp_project_text = category.project_text[0,254]
      end
      
      # use #update_column because it skips validations AND callbacks
      category.update_column(:temp_project_text, temp_project_text)
    end
    
    # delete the old column since we have all the data safe in the
    # temp_project_text
    remove_column :categories, :project_text
  
    # rename the temp_column to our original column name
    rename_column :categories, :temp_project_text, :project_text
  end
end
