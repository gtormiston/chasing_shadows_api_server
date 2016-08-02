def post_user(email: "test@test.com",
              name: "test user",
              password: "password",
              password_confirmation: "password")

  post '/api/v1/users',
        params: {user: {name: name,
                        email: email,
                        password: password,
                        password_confirmation: password
                        }
                }
end

def monster_names(response_json)
  parsed_response = JSON.parse(response_json)
  monster_names = parsed_response.map { |monster| monster["name"] }
end

def attack_enemy(enemy_id)
  patch "/api/v1/enemies/#{enemy_id}", headers:{ "HTTP_AUTHORIZATION" => "Token token=\"#{@user.api_key}\""}
end

def update_location(user_id, location)
  user_api_key = User.find(user_id).api_key
  patch "/api/v1/users/#{user_id}", headers: { "HTTP_AUTHORIZATION" => "Token token=\"#{user_api_key}\"",
                                              "HTTP_USER_LATITUDE" => location["lat"],
                                              "HTTP_USER_LONGITUDE" => location["lng"]}
end

def log_in(name: "test1",
           password: "password")
  post '/api/v1/sessions', params: {name: name,
                                    password: password}
end
