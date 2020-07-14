ActiveAdmin.register Staff do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :position, :desc, :speciality
  #
  # or
  permit_params do
    permitted = [:name, :position, :desc, :speciality]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :desc, as: :text, label: 'Description'
      f.input :speciality, as: :select, collection: ['Angular', 'React', 'Wordpress', 'PHP']
      # f.input :speciality, as: :select, multiple: true, collection: ['Angular', 'React', 'Wordpress', 'PHP'] , input_html: {style:'width:80%'}
    end
    f.actions
  end
  
end
