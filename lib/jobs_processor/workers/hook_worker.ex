defmodule JobsProcessor.HookWorker do
  require Logger

  use Oban.Worker,
    queue: :hooks,
    priority: 3,
    max_attempts: 5,
    tags: ["hook"],
    unique: [period: 30]

  @impl Oban.Worker
  def perform(job) do
    IO.inspect(job)
    Logger.warn("run job")

    :ok
  end
end
