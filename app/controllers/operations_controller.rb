class OperationsController < ApplicationController
  # before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_client
  # GET /operations or /operations.json
  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations
  end

  # GET /operations/1 or /operations/1.json
  # def show
  # end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  # def edit
  # end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params.except(:group_ids))
    @groups = Group.where(id: operation_params[:group_ids])

    if !@operation.valid?
      flash.now[:notice] = 'Kindly create a valid operation by filling all information'
      render :new, status: :unprocessable_entity
    elsif @groups.empty?
      flash.now[:notice] = 'Minimum of 1 group is needed'
      render :new, status: :unprocessable_entity

    elsif @operation.save

      @groups.each do |group|
        group.operations << @operation
      end
      flash.now[:notice] = 'Operation was successful'
      redirect_to root_path

    else
      flash.now[:notice] = 'An unexpected error occurred'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: []).merge(author_id: @client.id)
  end
end
