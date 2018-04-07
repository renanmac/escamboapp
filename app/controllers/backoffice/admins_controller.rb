class Backoffice::AdminsController < BackofficeController

	before_action :set_admin, only: [:edit, :update, :destroy]

  def index
  	@admins = Admin.with_full_access
  end

  def new
    @admin = Admin.new
  end
   
  def create
    @admin = Admin.new(params_admin)

    if @admin.save
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.email} foi cadastrado com sucesso!"
    else
      render 'new'
    end

  end

  def edit
  end

  def update

  	pwd = params[:admin][:password]
    pwd_confirmation = params[:admin][:password_confirmation]

  	if pwd.blank? && pwd_confirmation.blank?
  		params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
  	end

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.email} foi atualizado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.email} foi excluído com sucesso!"
    else
      render :index
    end

  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
      params.require(:admin).permit(:name, :role, :email, :password, :password_confirmation)
    end

end
