defmodule DeepThought.Slack.Handler.DeleteTest do
  @moduledoc """
  Test suite for the delete action handler.
  """

  use DeepThought.DataCase
  use DeepThought.MockCase
  alias DeepThought.Slack
  alias DeepThought.Slack.Handler.Delete

  @message %{
    user_id: "U12345",
    channel_id: "C12345",
    message_ts: "123456789.123456",
    target_language: "JA",
    status: "success"
  }
  @context %{
    "container" => %{
      "channel_id" => @message.channel_id,
      "message_ts" => @message.message_ts,
      "thread_ts" => "T12345"
    },
    "user" => %{"id" => @message.user_id}
  }

  setup do
    {:ok, translation} = Slack.create_translation(@message)

    {:ok, translation: translation}
  end

  test "delete_message/1 returns :ok atom on success", %{translation: translation} do
    assert :ok == Delete.delete_message(nil, @context)
  end
end
