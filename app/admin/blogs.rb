ActiveAdmin.register Blog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :path, :tags, :desc, :content, :images
  #
  # or
  #
  permit_params do
    permitted = [:title, :path, :tags, :desc, :content, :images]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :path
      f.input :tags
      f.input :desc, as: :ckeditor
      f.input :content, as: :ckeditor
      f.input :images
    end
    f.submit
  end
end
