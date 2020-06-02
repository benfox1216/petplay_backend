class ParkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location
end