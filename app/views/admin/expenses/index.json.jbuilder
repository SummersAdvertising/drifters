json.array!(@admin_expenses) do |admin_expense|
  json.extract! admin_expense, :id
  json.url admin_expense_url(admin_expense, format: :json)
end
