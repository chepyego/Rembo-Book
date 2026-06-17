class Avo::Resources::Schedule < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :title, as: :text
    field :start, as: :date_time
    field :end, as: :date_time
    field :manicurist_id, as: :number
    field :tenant_id, as: :number
    field :tenant, as: :belongs_to
    field :manicurist, as: :belongs_to
    field :bookings, as: :has_many
  end
end
