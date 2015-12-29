require 'test_helper'

class Admin::ExpensesControllerTest < ActionController::TestCase
  setup do
    @admin_expense = admin_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_expense" do
    assert_difference('Admin::Expense.count') do
      post :create, admin_expense: {  }
    end

    assert_redirected_to admin_expense_path(assigns(:admin_expense))
  end

  test "should show admin_expense" do
    get :show, id: @admin_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_expense
    assert_response :success
  end

  test "should update admin_expense" do
    patch :update, id: @admin_expense, admin_expense: {  }
    assert_redirected_to admin_expense_path(assigns(:admin_expense))
  end

  test "should destroy admin_expense" do
    assert_difference('Admin::Expense.count', -1) do
      delete :destroy, id: @admin_expense
    end

    assert_redirected_to admin_expenses_path
  end
end
