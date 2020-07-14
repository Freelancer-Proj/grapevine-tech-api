ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :reviewer, :position, :avatar
  #
  # or
  #
  permit_params do
    permitted = [:content, :reviewer, :position, :avatar]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :content, as: :text
      f.input :reviewer
      f.input :position
      f.input :avatar
    end
    f.actions
  end
  
end
