defmodule JobsProcessor.HookWorker do
  require Logger

  use Oban.Worker,
    queue: :hooks,
    priority: 3,
    max_attempts: 5,
    tags: ["hook"]

  @min 60

  @delay [0, 5 * @min, 10 * @min, 20 * @min, 60 * @min, 120 * @min]

  @impl Worker
  def perform(_args) do
    Logger.warn("start to perform")

    performing()

    Logger.warn("done")

    # If returns :ok, then the job is done for Oban
    # elise if {:error, ...} then retry in n time (4 strategies for the backoff)
    Enum.random([:ok, {:error, "An error ..."}])
  end

  @impl Worker
  def backoff(%Job{attempt: attempt}) do
    Logger.warn("n°#{attempt} : #{Enum.at(@delay, attempt, 360 * @min)}")
    Enum.at(@delay, attempt, 360 * @min)
  end

  defp performing do
    :timer.sleep( 3 * 1000)
  end
end
