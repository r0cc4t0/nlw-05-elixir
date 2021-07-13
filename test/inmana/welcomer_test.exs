defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "When the user is special, returns a special message." do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special!"}
      result = Welcomer.welcome(params)
      assert result == expected_result
    end

    test "When the user is not special, returns a message." do
      params = %{"name" => "Rafael", "age" => "25"}
      expected_result = {:ok, "Welcome Rafael!"}
      result = Welcomer.welcome(params)
      assert result == expected_result
    end

    test "When the user is under age, returns an error." do
      params = %{"name" => "Rafael", "age" => "17"}
      expected_result = {:error, "You shall not pass Rafael!"}
      result = Welcomer.welcome(params)
      assert result == expected_result
    end
  end
end
