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

  controller do
    resources_configuration[:self][:finder] = :find_by_path
  end

  permit_params do
    permitted = [:title, :path, :tags, :desc, :content, :images]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :path
      f.input :tags, as: :tags
      f.input :desc, as: :ckeditor, label: 'Description'
      f.input :content, as: :ckeditor
      f.input :images, as: :file, hint: (f.object.new_record? || f.object.images.blank?) ? 'No have image' : image_tag(f.object.images.url(:thumb))
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :tags
    column :desc
    column :content
    column :images do |ad|
      image_tag url_for(ad.images.url(:thumb))
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :path
      row :tags
      row :desc
      row :content
      row :images do |ad|
        image_tag url_for(ad.images.url)
      end
    end
  end
end
