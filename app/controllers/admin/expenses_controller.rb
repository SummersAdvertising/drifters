class Admin::ExpensesController < AdminController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create, :update]

  respond_to :html

  def index
    @expenses = Expense.all
    respond_with(@expenses)
  end

  def show
    respond_with(@expense)
  end

  def new
    @expense = Expense.new
    respond_with(@expense)
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.save
    redirect_to admin_expenses_path
  end

  def update
    @expense.update(expense_params)
    redirect_to admin_expenses_path
  end

  def destroy
    if @expense.destroy
      render json: { text: 'success!' }
    end
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params[:expense].permit!
    end
end
