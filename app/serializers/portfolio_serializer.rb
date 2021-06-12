class PortfolioSerializer < ActiveModel::Serializer
    attributes :id, :title, :type_portfolio, :desc, :cover, :content, :period, :media, :main_tech, :created_at, :updated_at
    has_many :portfolio_images
  end
  