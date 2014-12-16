ActiveAdmin.register User do
permit_params :email, :password, :password_confirmation, :role, :company_id

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :company
    column :role
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :role, prompt: "Select", as: :select, collection: User.roles.keys
      f.input :company_id, as: :select, collection: Company.all
    end
    f.actions
  end

end
