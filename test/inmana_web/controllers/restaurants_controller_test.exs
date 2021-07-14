defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "When all parameters are valid, creates a user.", %{conn: conn} do
      params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri Cascudo"
               }
             } = response
    end

    test "When there are invalid parameters, returns an error.", %{conn: conn} do
      params = %{name: "S", email: ""}

      expected_response = %{
        "message" => %{
          "name" => ["should be at least 2 character(s)"],
          "email" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
