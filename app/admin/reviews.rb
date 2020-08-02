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
      f.input :reviewer
      f.input :content, as: :text
      f.input :position
      f.input :avatar, as: :file, hint: (f.object.new_record? || f.object.avatar.blank?) ? 'No have image' : image_tag(f.object.avatar.url(:thumb))
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :reviewer
    column :content
    column :position
    column :avatar do |ad|
      image_tag url_for(ad.avatar.url(:thumb))
    end
    actions
  end

  show do
    attributes_table do
      row :reviewer
      row :content
      row :position
      row :avatar do |ad|
        image_tag url_for(ad.avatar.url)
      end
    end
  end
  
end
