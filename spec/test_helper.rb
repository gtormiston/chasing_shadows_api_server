def post_user(email: "test@test.com",
              name: "test user",
              password: "password")

  post '/api/v1/users',
        params: {user: {name: name,
                        email: email,
                        password: password
                        }
                }
end
