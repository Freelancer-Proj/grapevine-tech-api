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
    if params[:blog]
      params[:blog][:path] = params[:blog][:path].downcase
    end
    permitted = [:title, :path, :tags, :desc, :content, blog_images_attributes: [:id, :image, :_destroy ], blogs_staffs_attributes: [:id, :staff_id, :_destroy ]]
    permitted << :other if params[:action] == 'create'
    permitted
  end

  # controller do
  #   def create
  #     ActiveRecord::Base.transaction do
  #       @blog = Blog.new(permitted_params[:blog])
  #       if @blog.save
  #         redirect_to blog_path(@blog.id)
  #       else
  #         render 'new'
  #       end
  #     end
  #   end
  # end

  form html: {multipart: :true} do |f|
    f.inputs do
      f.input :title
      f.input :path
      f.input :tags, as: :tags
      f.input :desc, as: :ckeditor, label: 'Description'
      f.input :content, as: :ckeditor

      f.inputs "Images" do
        if f.object.blog_images.length > 0
          f.has_many :blog_images, heading: false, allow_destroy: true do |cd|
            cd.input :image, as: :file, hint: (cd.object.image.blank?) ? 'No have image' : image_tag(cd.object.image.url(:thumb))
          end
        else
          f.fields_for :blogs_images, for: BlogImage.new do |i|
            i.file_field :image, :multiple => true, name: "blog[blog_images_attributes][][image]"
          end
        end
      end
      f.inputs "Responser" do
        f.has_many :blogs_staffs, heading: false, allow_destroy: true do |cd|
          cd.input :staff_id, as: :select, collection: Staff.all.map{|s| [s.name, s.id]}
        end
      end
    end
    f.actions
  end

  index do |blog|
    selectable_column
    column :id
    column :path
    column :title
    column :tags
    column :desc
    column :content
    column 'Responser' do |b|
      ul do
        b.staffs.each do |staff|
          li do 
            staff.name
          end
        end
      end
    end
    column 'Image' do |i|
      ul do
        i.blog_images.each do |img|
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
      row :path
      row :tags
      row :desc
      row :content
      row "Responser" do
        div do
          blog.staffs.each do |staff|
            div do 
              staff.name
            end
          end
        end
      end
      row "Images" do
        div do
          blog.blog_images.each do |img|
            div do 
              image_tag(img.image.url(:thumb))
            end
          end
        end
      end
    end
  end
end
