class GroupsController < ApplicationController
  # before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  before_action :set_client
  # GET /groups or /groups.json
  def index
    if current_user.nil?
      redirect_to get_started_path
      return
    end
    @groups = current_user.groups
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  # def edit
  # end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    if !@group.valid?
      flash.now[:notice] = 'Kindly create a valid group by filling all information'
      render :new, status: :unprocessable_entity
    elsif !image_exists?(group_params[:icon])
      flash.now[:notice] = 'The link does not have image'
      render :new, status: :not_found
    elsif @group.save
      flash[:notice] = 'Group was successful'
      redirect_to group_operations_path(@group.id), method: :get

    else
      flash.now[:notice] = 'An unexpected error occurred'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon).merge(user_id: @client.id)
  end
end
# PATCH/PUT /groups/1 or /groups/1.json
# def update
#   respond_to do |format|
#     if @group.update(group_params)
#       format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
#       format.json { render :show, status: :ok, location: @group }
#     else
#       format.html { render :edit, status: :unprocessable_entity }
#       format.json { render json: @group.errors, status: :unprocessable_entity }
#     end
#   end
# end

# DELETE /groups/1 or /groups/1.json
# def destroy
#   @group.destroy

#   respond_to do |format|
#     format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
#     format.json { head :no_content }
#   end
# end

# private
# Use callbacks to share common setup or constraints between actions.
# def set_group
#   @group = Group.find(params[:id])
# end

# Only allow a list of trusted parameters through.
