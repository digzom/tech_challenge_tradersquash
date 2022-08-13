defmodule TechChallengeTradesquash do
  @moduledoc false
  alias TechChallengeTradesquash.Authors

  defdelegate create_author(author), to: Authors.Create, as: :call
end
