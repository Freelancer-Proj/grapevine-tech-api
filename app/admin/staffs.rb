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
    permitted = [:name, :position, :desc, :speciality, :avatar]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
      f.input :desc, as: :text, label: 'Description'
      f.input :speciality, as: :tags, collection: ['Angular', 'React', 'Wordpress', 'Php', 'Aws', 'Gcp', 'Swift', 'Java', 'Agora', 'Go', 'Nodejs']
      f.input :avatar, :as => :radio, :collection => {"Founder" => "https://res.cloudinary.com/dfdi9fgof/image/upload/v1595993781/grapevine/avatar/founder_uhtmmh.png",
      "Manager" => "https://res.cloudinary.com/dfdi9fgof/image/upload/v1595993781/grapevine/avatar/manager_pchwp5.png",
      "Secretary" => "https://res.cloudinary.com/dfdi9fgof/image/upload/v1595993781/grapevine/avatar/secretary_rucsnk.png",
      "Supervisor" => "https://res.cloudinary.com/dfdi9fgof/image/upload/v1595993781/grapevine/avatar/supervisor_vc119s.png"}
    end
    f.actions
  end
end
