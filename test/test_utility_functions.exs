defmodule UtilityFunctionsTest do
  use ExUnit.Case, async: false
  use ExCheck
  use Plug.Test
  alias ElixirDocker.Router.TasksRouter

  property :response_func do
    for_all id in int() do
      conn = conn(:get, "/")
      conn = TasksRouter.response(conn, 200, %{info: "Data #{id}"})

      assert conn.state == :sent
      assert conn.status == 200
      assert conn.resp_body =~ ~r/{"info":"Data #{id}"}/i
    end
  end

  property :valid_data_true_func do
    for_all _ in int() do
      data = %{
        "title" => "here",
        "description" => "here",
        "due_date" => "here",
        "priority" => "here"
      }

      assert TasksRouter.valid_data?(data) == true
    end
  end

  property :valid_data_false_func do
    for_all {x, y, z, k} in {
      unicode_string(),
      unicode_string(),
      unicode_string(),
      unicode_string()
      } do
      data = %{
        x => "here",
        y => "here",
        z => "here",
        k => "here"
      }

      assert TasksRouter.valid_data?(data) == false
    end
  end

#   property :stringify_dates_valid_input do
#     for_all _ in int() do
#       utc = DateTime.utc_now

#       IO.inspect Date.to_date(utc)

#       raw_data = [%{
#         inserted_at: {
#           Date.to_string(Date.to_date(utc)),
#           Time.to_string(Time.to_time(utc))
#           },
#         due_date: Date.from_iso8601!("2017-09-27")
#       }]

#       IO.puts inspect raw_data

#       assert TaskRouter.stringify_dates raw_data == %{
#           inserted_at: Date.to_string(utc),
#           due_date: "2017-09-27"}
#     end
#   end
end