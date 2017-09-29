defmodule KcmCoaches.CoachType do
  @moduledoc """
  Type of coach used by KCM - struct
  """
  defstruct [:type, :start, :end, :length, :drive_type, :ac]
  @typedoc """
  Models a category of King County Metro bus
  """
  @type t :: %__MODULE__{
    type: coach_type,
    start: integer,
    end: integer,
    length: integer,
    drive_type: drive_type,
    ac: boolean
  }

  @typedoc """
  Types of coaches owned by King County Metro

  All are New Flyer except:
  - Gillig Phantom (30 and 40 foot)
  - Proterra Catalyst

  NF coaches are encoded as follows:

  [X][drive][length][floor]

  - X indicates Xcelsior series  
  - Drive type includes:
  -- **D**iesel
  -- **E**lectric *(DE indicates hybrid)*
  -- **T**rolley
  - Floor indicates high or low
  """
  @type coach_type :: :d60hf | :phantom40 | :phantom30 | :d40lf | :de60lf | 
  :d60lf | :de60lf2 | :de60lfa | :orion7 | :de60lfr | :de60lfr_rr | :xde35 |
  :xde40 | :xt40 | :xde60_rr | :xt60 | :catalyst | :xde60 | :xde60_suburban
  @typedoc "Bus drivetrain"
  @type drive_type :: :diesel | :hybrid | :trolley | :battery

end
