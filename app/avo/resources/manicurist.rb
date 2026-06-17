class Avo::Resources::Manicurist < Avo::BaseResource
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
    field :experience, as: :text
    field :user_id, as: :number
    field :tenant_id, as: :number
    field :manicurist_image, as: :file
    field :user, as: :belongs_to
    field :tenant, as: :belongs_to
    field :bookings, as: :has_many
    field :services, as: :has_many, through: :bookings
    field :schedules, as: :has_many
  end
end
