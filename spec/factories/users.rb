FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    family_name {'田中'}
    first_name {'一郎'}
    family_name_kana {'タナカ'}
    first_name_kana {'イチロー'}
    birth_day {'1932-01-01'}
  end
end