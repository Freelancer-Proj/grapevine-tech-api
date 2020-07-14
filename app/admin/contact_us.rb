ActiveAdmin.register ContactUs do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :inquire_type, :company_name, :position, :name, :furigana_name, :email, :phone, :content
  #
  # or
  #
  permit_params do
    permitted = [:inquire_type, :company_name, :position, :name, :furigana_name, :email, :phone, :content]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :furigana_name
      f.input :email
      f.input :phone
      f.input :company_name
      f.input :position
      f.input :content, as: :text
      f.input :inquire_type, as: :select, collection: ['案件のご相談', 'サービスに関するご相談', '業務提携のご相談', '採用への応募, その他']
    end
    f.actions
  end
  
end
