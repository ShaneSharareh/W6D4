class AddIndexToArtworkShares < ActiveRecord::Migration[5.2]
  def change
    #we want this database to have the same artwork id multiple times with 
    #different viewer ids
    #we dont want repeated data,(same artwork and viewer id)
    remove_index :artwork_shares, :artwork_id
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
