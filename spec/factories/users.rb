FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'花子'}
    first_name            {'山田'}
    last_kana             {'ヤマダ'}
    first_kana            {'ハナコ'}
    birthday              {'1945-08-15'}
  end
end