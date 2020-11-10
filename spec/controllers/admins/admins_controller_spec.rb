require 'rails_helper'

RSpec.describe Admins::AdminsController, type: :controller do

	describe '職員のテスト' do
		let(:admin) { create(:admin) }
		before do
			visit new_admin_session_path
			fill_in 'admin[email]', with: admin.email
			fill_in 'admin[password]', with: admin.password
			click_button 'Log in'
		end

		describe '職員情報ページ'do
		  	context "職員情報ページが正しく表示される" do
		  		before do
		  			get admins_admin_path
		  		end
		  		it 'リクエストは200 OKとなること' do
		        	expect(response.status).to eq 200
		        end
		    end
		end

		describe '編集のテスト' do
		    context '自分の編集画面への遷移' do
			  it '遷移できる' do
			    visit edit_admins_admin_path(admin)
			    expect(current_path).to eq('/admins/admin/' + admin.id.to_s + '/edit')
			  end
			end
		end

		context '表示の確認' do
			before do
				visit edit_admins_admin_path(admin)
			end
			it '施設編集フォームが表示される' do
				expect(page).to have_field 'admin[facility_id]'
			end
			it '名前編集フォームに自分の名前が表示される' do
				expect(page).to have_field 'admin[name]', with: admin.name
			end
			it 'メール編集フォームに自分の自己紹介が表示される' do
				expect(page).to have_field 'admin[email]', with: admin.email
			end
			it '編集に成功する' do
				click_button '更新'
				expect(page).to have_content 'successfully'
				expect(current_path).to eq('/admins/admin/' + admin.id.to_s)
			end
			it '編集に失敗する' do
				fill_in 'admin[name]', with: ''
				click_button '更新'
				expect(page).to have_content 'error'
				expect(current_path).to eq('/admins/admin/' + admin.id.to_s)
			end
		end

		describe '一覧画面のテスト' do
			before do
				visit admins_admins_path
			end
			context '表示の確認' do
				it '職員一覧と表示される' do
					expect(page).to have_content('職員一覧')
				end
				it '自分の名前が表示される' do
					expect(page).to have_content admin.name
				end
				it 'showリンクが表示される' do
					expect(page).to have_link, href: admins_admin_path(admin)
				end
			end
		end

		describe '詳細画面のテスト' do
			before do
				visit admins_admin_path(admin)
			end
			context '表示の確認' do
				it '施設名が表示される' do
					expect(page).to have_content facility.name
				end
				it '自分の名前が表示される' do
					expect(page).to have_content admin.name
				end
				it 'メール編集フォームに自分の自己紹介が表示される' do
					expect(page).to  have_content admin.email
				end
			end
		end
    end
end
