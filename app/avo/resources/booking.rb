class Avo::Resources::Booking < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :user_id, as: :number
    field :service_id, as: :number
    field :date, as: :date_time
    field :status, as: :text
    field :name, as: :text
    field :email, as: :text
    field :phone_number, as: :text
    field :tenant_id, as: :number
    field :user, as: :belongs_to
    field :service, as: :belongs_to
    field :tenant, as: :belongs_to
  end
end
