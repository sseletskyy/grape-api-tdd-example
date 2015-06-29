FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    sequence (:email) { |n| "user#{n}@test.com" }
    sequence (:first_name) { |n| "FirstName#{n}" }
    sequence (:last_name) { |n| "LastName#{n}" }
    password 'change_me_s0meday'

    factory :admin, class: User do
      after(:create) do |user|
        user.add_role :admin
        company = create(:company)
        user.company_ids = [company.id]
        department = create(:department, company: company)
        user.department_ids = [department.id]
      end
    end

  end
end


