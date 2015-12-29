class Admin::ExpensesController < AdminController
  before_action :set_admin_expense, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_expenses = Expense.all
    respond_with(@admin_expenses)
  end

  def show
    respond_with(@admin_expense)
  end

  def new
    @admin_expense = Expense.new
    respond_with(@admin_expense)
  end

  def edit
  end

  def create
    @admin_expense = Expense.new(expense_params)
    @admin_expense.save
    respond_with(@admin_expense)
  end

  def update
    @admin_expense.update(expense_params)
    respond_with(@admin_expense)
  end

  def destroy
    @admin_expense.destroy
    respond_with(@admin_expense)
  end

  private
    def set_admin_expense
      @admin_expense = Expense.find(params[:id])
    end

    def admin_expense_params
      params[:admin_expense]
    end
end
