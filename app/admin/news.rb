ActiveAdmin.register New do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :notify_at
  #
  # or
  #
  permit_params do
    permitted = [:title, :content, :notify_at]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :notify_at, as: :date_time_picker
      f.input :title
      f.input :content, as: :ckeditor
    end
    f.actions
  end
  
end
