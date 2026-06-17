class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :email_address, as: :text
    field :role, as: :text
    field :first_name, as: :text
    field :last_name, as: :text
    field :tenant_id, as: :number
    field :tenant, as: :belongs_to
    field :sessions, as: :has_many
    field :bookings, as: :has_many
  end
end
