class Admins::ContactsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@contacts = Contact.all.page(params[:page])
	end

	def new
		@contact = Contact.new
		@class_names = ClassName.all
	end

	def confirm
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
		render :new if @contact.invalid?
	end

	def create
		@contact = Contact.new(contact_params)
        @contact.admin_id = current_admin.id
		if @contact.save
      		flash[:success] = "送信に成功しました"
      		redirect_to admins_contacts_path
    	else
      		flash.now[:danger]="送信に失敗しました"
	      	render 'new'
    	end
    end

    def show
        @contact = Contact.find(params[:id])
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

    # 	if search
    # 		@class_name = Classname.where('class_name_id LIKE' "%#{search}%")
    # 	else
    # 		@class_name.children.each do |child|
    # 		@contact = current_admin.contacts.build(user: child.user, title: params[:title], body: params[:body])
    # 		@contact.save
    # 	end
    # end

    private

    def contact_params
        params.require(:contact).permit(:title, :body, :image)
    end

end
