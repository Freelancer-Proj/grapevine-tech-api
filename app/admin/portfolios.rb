ActiveAdmin.register Portfolio do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :type_portfolio, :desc, :cover, :content
  #
  # or
  #
  permit_params do
    permitted = [:title, :type_portfolio, :desc, :cover, :content]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :type_portfolio
      f.input :desc, as: :text
      f.input :content, as: :ckeditor
      f.input :cover, as: :file, hint: (f.object.new_record? || f.object.cover.blank?) ? 'No have image' : image_tag(f.object.cover.url(:thumb))
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :title
    column :type_portfolio
    column :desc
    column :content
    column :cover do |ad|
      image_tag url_for(ad.cover.url(:thumb))
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :type_portfolio
      row :desc
      row :content
      row :cover do |ad|
        image_tag url_for(ad.cover.url)
      end
    end
  end
  
end
