defmodule TechChallengeTradesquash do
  @moduledoc false
  alias TechChallengeTradesquash.Author

  defdelegate create_author(author), to: Author.Create, as: :call
end
