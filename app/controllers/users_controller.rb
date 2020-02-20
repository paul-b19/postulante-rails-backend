class UsersController < ApplicationController
  
  # GET /users/:id
  def show
    user = User.find(user_params[:id])
    render json: user.to_json(:include => {
      :collections => {:only => [:id, :name, :user_id]}, 
      :requests => {:except => [:created_at, :updated_at]}
    }, :except => [:created_at, :updated_at])
  end

  # POST /signup/  for signup
  def create
    user = User.new(
      username: user_params[:username],
      password: user_params[:password])
    if user.save
      create_example_collection(user)
      render json: user, except: [:password_digest, :created_at, :updated_at]
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  # POST /login/  for login
  def login
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      render json: user, except: [:password_digest, :created_at, :updated_at]
    else
      render json: {errors: "Wrong Username or Password!"}
    end
  end

  # creating examples for new account
  def create_example_collection(user)
    collection = Collection.create(
      name: 'Examples',
      user_id: user.id
    )
    req_a = Request.create(
      title: 'GET with params and api_key',
      method: 'GET',
      url: 'https://calendarific.com/api/v2/holidays',
      collection_id: collection.id
    )
    attr_a = [{attr_type: 'params', key: 'country', value: 'US', description: 'get all US holidays'},
               {attr_type: 'params', key: 'year', value: '2020', description: 'for 2020'},
               {attr_type: 'auth', key: 'api_key', value: '823747516d829b140ef9807ad001d167526c64bf', description: 'params'}]
    attr_a.each do |atr|
      Attrib.create(
        attr_type: atr[:attr_type],
        key: atr[:key],
        value: atr[:value],
        description: atr[:description],
        request_id: req_a.id
      )
    end

    req_b = Request.create(
      title: 'GET User not found 404',
      method: 'GET',
      url: 'https://reqres.in/api/users/23',
      collection_id: collection.id
    )

    req_c = Request.create(
      title: 'POST Create user',
      method: 'POST',
      url: 'https://reqres.in/api/users',
      collection_id: collection.id
    )
    Attrib.create(
      attr_type: 'headers',
      key: 'Content-type',
      value: 'application/json',
      description: '',
      request_id: req_c.id
    )
    Body.create(
      body_type: 'Raw',
      key: '',
      value: '',
      description: '',
      raw_body: 
'{
  "name": "morpheus",
  "job": "leader"
}',
      request_id: req_c.id
    )

    req_d = Request.create(
      title: 'UPDATE an employee record',
      method: 'PUT',
      url: 'http://dummy.restapiexample.com/api/v1/update/21',
      collection_id: collection.id
    )
    Attrib.create(
      attr_type: 'headers',
      key: 'Content-type',
      value: 'application/json',
      description: '',
      request_id: req_d.id
    )
    Body.create(
      body_type: 'Raw',
      key: '',
      value: '',
      description: '',
      raw_body: 
'{
  "name":"test1",
  "salary":"1123",
  "age":"23"
}',
      request_id: req_d.id
    )
    
    req_e = Request.create(
      title: 'DELETE a resource',
      method: 'DELETE',
      url: 'https://jsonplaceholder.typicode.com/posts/1',
      collection_id: collection.id
    )
  end

  private
  
  def user_params
    params.permit(:id, :username, :password)
  end

end
