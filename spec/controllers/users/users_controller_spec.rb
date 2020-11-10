require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do

	describe 'ユーザー認証のテスト' do
	  	describe 'ユーザー新規登録' do
		    before do
		    	visit new_user_registration_path
		    end
		    context '新規登録画面に遷移' do
		    	it '新規登録に成功する' do
		        	fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
		        	fill_in 'user[email]', with: Faker::Internet.email
		        	fill_in 'user[password]', with: 'password'
		        	fill_in 'user[password_confirmation]', with: 'password'
		        	click_button '新規登録'
		      	end
	      		it '新規登録に失敗する' do
			        fill_in 'user[name]', with: ''
			        fill_in 'user[email]', with: ''
			        fill_in 'user[password]', with: ''
			        fill_in 'user[password_confirmation]', with: ''
			        click_button '新規登録'
	      		end
	    	end
	  	end
	  	describe 'ユーザーログイン' do
		    let(:user) { create(:user) }
		    before do
		      visit new_user_session_path
		    end
	  	end
	end

	describe 'ユーザーのテスト' do
		let(:user) { create(:user) }
	  	before do
		    visit new_user_session_path
		    fill_in 'user[name]', with: user.name
		    fill_in 'user[password]', with: user.password
		    click_button 'Log in'
	  	end

	  	describe '編集のテスト' do
		    context '自分の編集画面への遷移' do
		      	it '遷移できる' do
			        visit edit_user_path(user)
			        expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
			    end
	    end

	    context '表示の確認' do
		    before do
		        visit edit_user_path(user)
		    end
	      	it '会員情報編集と表示される' do
	        	expect(page).to have_content('会員情報編集')
	      	end
	      	it '名前編集フォームに自分の名前が表示される' do
	        	expect(page).to have_field 'user[name]', with: user.name
	      	end
	     	it '住所編集フォームに自分の住所が表示される' do
	        	expect(page).to have_field 'user[address]', with: user.address
	      	end
	      	it '編集に成功する' do
	        	click_button 'Update User'
	        	expect(page).to have_content 'successfully'
	        	expect(current_path).to eq('/users/' + user.id.to_s)
	      	end
	      	it '編集に失敗する' do
	       		fill_in 'user[name]', with: ''
	        	click_button 'Update User'
	        	expect(page).to have_content 'error'
	        	expect(current_path).to eq('/users/' + user.id.to_s)
	      	end
	    end
	end

	describe '詳細画面のテスト' do
	    before do
	      visit user_path(user)
	    end
	    context '表示の確認' do
	      	it '会員情報詳細と表示される' do
	        	expect(page).to have_content('会員情報詳細')
	      	end
	      	it '自分の名前が表示される' do
				expect(page).to have_content user.name
			end
			it 'メール編集フォームに自分の自己紹介が表示される' do
				expect(page).to  have_content user.email
			end
	    end
	end
end
