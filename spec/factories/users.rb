FactoryGirl.define do
	factory :user do
		name 'User (test)'
		email 'email@test.com'
		password 'password'
		password_confirmation 'password'
	end
end