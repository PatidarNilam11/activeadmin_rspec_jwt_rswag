ActiveAdmin.register Student, as: "Student_details " do
	menu parent: "details "
  
  ActiveAdmin.register Course, as: "course_details " do
    menu parent: "details "

    permit_params :cname,:student_id 
   
    index do
      selectable_column
      id_column
      column :cname
      column :student_id
        
      actions
    end
  end
  
  permit_params :name,:age ,:roll_no 

  scope :actives
 
	index do
    selectable_column
    id_column
    column :name
    column :age
    column :roll_no
    column :created_at 
    column :updated_at
    actions
  end

  filter :name
  filter :roll_no
	filter :age
  filter :delete
  
  show do 
    attributes_table do  
      row :name
      row :age
		  row :roll_no
      row :created_at
      row :updated_at
    end   
  end 
    
  form do |f|
    f.inputs do
      f.input :name
      f.input :age
      f.input :roll_no
    end
    f.actions
  end

end

