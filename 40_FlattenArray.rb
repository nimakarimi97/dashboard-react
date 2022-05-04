class FlattenArray
  def self.flatten(array)
    array.flatten.delete_if(&:nil?)
  end
end
p flat_array =
    FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
