class PreparationSerializer < ActiveModel::Serializer
  attributes :created, :id, :year

  def created
    object.created_at
  end
end
