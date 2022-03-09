# JobsProcessor


```

JobsProcessor.HookWorker.new(%{event: "LOGOUT"}) |> Oban.insert()

```

```
Multiple jobs can be inserted in a single transaction:

Ecto.Multi.new()
|> Oban.insert(:b_job, MyApp.Business.new(%{id: 1}))
|> Oban.insert(:m_job, MyApp.Mailer.new(%{email: "brewser@example.com"}))
|> Repo.transaction()
```

```
JobsProcessor.HookWorker.new(%{event: "LOGOUT"}, scheduled_at: ~U[2020-12-25 19:00:56.0Z])  |> Oban.insert()
```

## Perform returns

The value returned from perform/1 can control whether the job is a success or a failure:

:ok or {:ok, value} — the job is successful; for success tuples the value is ignored
:discard or {:discard, reason} — discard the job and prevent it from being retried again. An error is recorded using the optional reason, though the job is still successful
{:error, error} — the job failed, record the error and schedule a retry if possible
{:snooze, seconds} — mark the job as snoozed and schedule it to run again seconds in the future. See Snoozing for more details.
