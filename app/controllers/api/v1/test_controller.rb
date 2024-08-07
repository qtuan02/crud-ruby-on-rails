class Api::V1::TestController < ApplicationController
  # before_action :set_test, only: %i[ show destroy update ]

  def index
    tests = Test.all
    json_response Messages::SUCCESS, true, tests.map { |test| test.as_json(except: [:created_at, :updated_at]) }, :ok
  end

  def show
    unless id_exist?(params[:id])
      json_response 'Không tìm thấy mã!', false, nil, :not_found and return
    end
    test = Test.find(params[:id])
    json_response Messages::SUCCESS, true, test.as_json(except: [:created_at, :updated_at]), :ok
  end

  def create
    if attribute_exist?(:contact_number, params[:test][:contact_number]) 
      json_response 'Số điện thoại đã tồn tại!', false, nil, :bad_request and return
    end
    if attribute_exist?(:email, params[:test][:email]) 
      json_response 'Email đã tồn tại!', false, nil, :bad_request and return
    end
    test = Test.new(create_params)
    if test.save
      json_response Messages::SUCCESS, true, test.as_json(except: [:created_at, :updated_at]), :ok
    else
      json_response Messages::FAIL, false, test.errors, :bad_request
    end
  end

  def destroy
    unless id_exist?(params[:id])
      json_response 'Không tìm thấy mã!', false, nil, :not_found and return
    end
    test = Test.find(params[:id])
    if test.destroy
      json_response Messages::SUCCESS, true, test.id, :ok
    else
      json_response Messages::FAIL, false, test.errors, :bad_request
    end
  end

  def update
    unless id_exist?(params[:id])
      json_response 'Không tìm thấy mã!', false, nil, :not_found and return
    end
    test = Test.find(params[:id])
    if test.update(update_params)
      json_response Messages::SUCCESS, true, test.as_json(except: [:password, :created_at, :updated_at]), :ok
    else
      json_response Messages::FAIL, false, test.errors, :bad_request
    end
  end

  private
    def attribute_exist?(key, value, id = nil)
      if id
        Test.where.not(id: id).exists?(key => value)
      else
        Test.exists?(key => value)
      end
    end

    def id_exist?(id)
      Test.exists?(id: id)
    end

    def create_params
      params.require(:test).permit(:first_name, :last_name, :age, :contact_number, :email, :password)
    end

    def update_params
      params.require(:test).permit(:first_name, :last_name, :age)
    end
end

