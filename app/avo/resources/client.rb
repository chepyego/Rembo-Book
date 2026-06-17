class Avo::Resources::Client < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :phone, as: :text
    field :user_id, as: :number
    field :tenant_id, as: :number
    field :user, as: :belongs_to
    field :tenant, as: :belongs_to
    field :bookings, as: :has_many
    field :services, as: :has_many, through: :bookings
  end
end
