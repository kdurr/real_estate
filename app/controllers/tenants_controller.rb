class TenantsController < ApplicationController
  def index
    @tenant = Tenant.all.order('last_name', 'first_name')
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      redirect_to new_tenant_path,
      notice: "Tenant successfully added"
    else
      render :new
    end
  end

  protected
  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :building_id, :email)
  end
end
