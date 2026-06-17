class Avo::Resources::Service < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :title, as: :text
    field :price, as: :number
    field :user_id, as: :number
    field :tenant_id, as: :number
    field :image, as: :file
    field :tenant, as: :belongs_to
    field :bookings, as: :has_many
    field :clients, as: :has_many, through: :bookings
    field :manicurists, as: :has_many, through: :bookings
    field :description, as: :trix
  end
end
