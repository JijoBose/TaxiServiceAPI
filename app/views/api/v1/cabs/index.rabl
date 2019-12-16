node(:success) { true }
child(@cabs, root: 'cabs', object_root: false) do
  attributes :id, :name, :color, :latitude, :longitude, :available
end
