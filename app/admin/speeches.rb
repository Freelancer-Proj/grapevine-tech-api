ActiveAdmin.register Speech do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content
  #
  # or
  #
  permit_params do
    permitted = [:title, :content]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
  form do |f|
    f.inputs do

      f.input :title, as: :ckeditor
      f.input :content, as: :ckeditor
    end
    f.actions
  end
end