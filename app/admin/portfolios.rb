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
    permitted = [:title, :type_portfolio, :desc, :cover, :content, :period, :media, :main_tech, portfolio_images_attributes: [:id, :image, :_destroy ]]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  form html: {multipart: :true} do |f|
    f.inputs do
      f.input :title
      f.input :type_portfolio
      f.input :desc, as: :text
      f.input :content, as: :ckeditor
      f.input :period
      f.input :media
      f.input :main_tech
      f.inputs "Images" do
        if f.object.portfolio_images.length > 0
          f.has_many :portfolio_images, heading: false, allow_destroy: true do |cd|
            cd.input :image, as: :file, hint: (cd.object.image.blank?) ? 'No have image' : image_tag(cd.object.image.url(:thumb))
          end
        else
          f.fields_for :portfolios_images, for: PortfolioImage.new do |i|
            i.file_field :image, :multiple => true, name: "portfolio[portfolio_images_attributes][][image]"
          end
        end
      end
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
    column :period
    column :media
    column :main_tech
    column 'Image' do |i|
      ul do
        i.portfolio_images.each do |img|
          li do
            image_tag(img.image.url(:thumb))
          end
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :type_portfolio
      row :desc
      row :content
      row :period
      row :media
      row :main_tech
      row "Images" do
        div do
          portfolio.portfolio_images.each do |img|
            div do 
              image_tag(img.image.url(:thumb))
            end
          end
        end
      end
    end
  end
  
end
