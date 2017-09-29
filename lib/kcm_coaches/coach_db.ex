defmodule KcmCoaches.CoachDb do
  alias KcmCoaches.CoachType

  @spec type_list() :: [CoachType.t]
  defp type_list, do: [
    %CoachType{type: :phantom40, start: 3200, end: 3594, length: 40,
                drive_type: :diesel, ac: false},
    %CoachType{type: :d60hf, start: 2300, end: 2573, length: 60,
                drive_type: :diesel, ac: false},
    %CoachType{type: :phantom30, start: 1100, end: 1194, length: 30,
               drive_type: :diesel, ac: false},
    %CoachType{type: :d40lf, start: 3600, end: 3699, length: 40,
               drive_type: :diesel, ac: true},
    %CoachType{type: :de60lf, start: 2600, end: 2812, length: 60,
               drive_type: :hybrid, ac: true},
        %CoachType{type: :d60lf, start: 2870, end: 2899, length: 60,
               drive_type: :diesel, ac: true},
    %CoachType{type: :de60lf2, start: 6813, end: 6865, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :de60lfa, start: 6000, end: 6019, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :orion7, start: 7001, end: 7199, length: 40,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :de60lfr, start: 6866, end: 6999, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :de60lfr, start: 6800, end: 6800, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :de60lfr_rr, start: 6020, end: 6117, length: 60,
               drive_type: :hybrid, ac: true},
#    %CoachType{type: :de60lfr_rr, start: 6040, end: 6073, length: 60,
#               drive_type: :hybrid, ac: true},
#    %CoachType{type: :de60lfr_rr, start: 6075, end: 6117, length: 60,
#               drive_type: :hybrid, ac: true},
    %CoachType{type: :xde35, start: 3700, end: 3759, length: 35,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :xde40, start: 7200, end: 7259, length: 40,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :xt40, start: 4300, end: 4409, length: 40,
               drive_type: :trolley, ac: true},
    %CoachType{type: :xde60_rr, start: 6200, end: 6219, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :xt60, start: 4500, end: 4563, length: 60,
               drive_type: :trolley, ac: true},
    %CoachType{type: :catalyst, start: 4601, end: 4603, length: 40,
               drive_type: :battery, ac: true},
    %CoachType{type: :xde60, start: 8000, end: 8084, length: 60,
               drive_type: :hybrid, ac: true},
    %CoachType{type: :xde60_suburban, start: 8100, end: 8199, length: 60,
               drive_type: :hybrid, ac: true}
  ]

  @doc ~S"""
  Find the type of a Metro bus from its coach number.

  ## Examples:
      
      iex> KcmCoaches.CoachDb.find_type(8040)
      %KcmCoaches.CoachType{type: :xde60, start: 8000, end: 8084, length: 60,
      drive_type: :hybrid, ac: true}
  """
  @spec find_type(integer) :: CoachType.t
  def find_type(coach_num) do
    Enum.filter(type_list(),&type_matches(&1,coach_num))
    |> List.first
  end

  @spec type_matches(CoachType.t,integer) :: boolean
  defp type_matches(coach_type, num) do
    num >= coach_type.start && num <= coach_type.end
  end

  @spec coach_models() :: [atom]
  def coach_models do
    Enum.map(type_list(),&Map.get(&1,:type))
    |> Enum.uniq
  end
  
end
