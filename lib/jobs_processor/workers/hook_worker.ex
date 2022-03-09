defmodule JobsProcessor.HookWorker do
  require Logger

  use Oban.Worker,
    queue: :hooks,
    priority: 3,
    max_attempts: 5,
    tags: ["hook"]

  @delay 3 * 1000

  @impl Oban.Worker
  def perform(args) do
    Logger.warn("start to perform")

    IO.inspect(args: args)
    performing()

    Logger.warn("done")

    # If returns :ok, then the job is done for Oban
    # elise if {:error, ...} then retry in n time (4 strategies for the backoff)
    Enum.random([:ok, {:error, "An error ..."}])
  end

  def performing do
    :timer.sleep(@delay)
  end
end
