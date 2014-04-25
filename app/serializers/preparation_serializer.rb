class PreparationSerializer < ActiveModel::Serializer
  attributes \
    :created,
    :id,
    :year,
    :age,
    :spouse_age,
    :interest_income,
    :taxable_income,
    :itemizing_deductions

  def created
    object.created_at
  end
end
