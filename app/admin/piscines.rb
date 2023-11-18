ActiveAdmin.register Piscine do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  
  # Uncomment all parameters which should be permitted for assignment
  
  # permit_params :name, :adress, :cp, :ville, :pays, :mail, :tel, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend, :user_id
  
  # or
  
  permit_params do
    permitted = [:name, :adress, :cp, :ville, :pays, :mail, :tel, :mondaystart, :mondayend, :tuesdaystart, :tuesdayend, :wednesdaystart, :wednesdayend, :thursdaystart, :thursdayend, :fridaystart, :fridayend, :saturdaystart, :saturdayend, :sundaystart, :sundayend, :image]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
