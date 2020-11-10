class Admins::ContactsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@contacts = Contact.all.page(params[:page])
	end

	def new
		@contact = Contact.new
		@class_names = ClassName.all
        @users = User.all
	end

	def confirm
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
        @user_ids = params[:contact_to][:user_ids]
        @class_name_ids = params[:contact_to][:class_name_ids]
        @image_path = contact_params[:image]#.empty? ? {} : contact_params[:image].path
		render :new if @contact.invalid?
	end

	def create
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
		if @contact.save
            params[:class_name_id].split(' ').map{|class_name_id|
                ContactTo.create(contact_id:@contact.id,class_name_id:class_name_id)
            }
            params[:user_id].split(' ').map{|user_id|
                ContactTo.create(contact_id:@contact.id,user_id:user_id)
            }

      		flash[:success] = "送信に成功しました"
      		redirect_to admins_contacts_path
    	else
      		flash.now[:danger]="送信に失敗しました"
	      	render 'new'
    	end
    end

    def show
        @contact = Contact.find(params[:id])
        contact_tos = @contact.contact_tos
        @class_names = []
        contact_tos.each do |contact_to|
            @class_names.push(contact_to.class_name)
        end
    end

    # def create
    	# やりたいこととしては会員それぞれに一つの連絡を作る
    	# 1. 送りたいクラスを検索する
    	#    * 画面側から params で送りたい複数のクラスの id を受け取る
    	#    * 複数受け取った id を基にクラスを検索
    	#    * `rails 複数検索` みたいな word でぐぐる
    	# 2. 検索したクラスの子ども ( children ) を全て取得する
    	# 3. children の数だけ, 連絡 ( contact ) をsave する

    	# class_name = ClassName.find(params[:class_id])# 複数検索のID
    	# class_name.children.each do |child|
    	# 	contact = current_admin.contacts.build(user: child.user, body: params[:body], title: params[:title])
    	# 	contact.save

    private

    def contact_params
        params.require(:contact).permit(:title, :body, :image)
    end


end
