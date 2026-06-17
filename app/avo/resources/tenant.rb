class Avo::Resources::Tenant < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :name, as: :text
    field :subdomain, as: :text
    field :email, as: :text
    field :phone_number, as: :text
    field :location, as: :text
    field :plan, as: :text
    field :active, as: :boolean
    field :operating_hours, as: :text
    field :services, as: :has_many
    field :users, as: :has_many
    field :manicurists, as: :has_many
    field :schedules, as: :has_many
    field :bookings, as: :has_many
    field :clients, as: :has_many
  end
end
