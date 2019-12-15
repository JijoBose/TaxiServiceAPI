node(:success) { true }
child(@customers, root: 'customers', object_root: false) do
  attributes :id, :name, :email
end
