ActiveAdmin.register User, as: "Users" do
  permit_params :username,:email ,:password 

  scope :actives
 
	index do
    selectable_column
    id_column
    column :username
    column :email
    column :password
    column :created_at 
    column :updated_at
    actions
  end

  filter :username
  filter :email
  filter :password
  filter :delete
  
  show do 
    attributes_table do  
      row :username
      row :email
	  row :password
      row :created_at
      row :updated_at
    end   
  end 
    
  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
    end
    f.actions
  end

end
