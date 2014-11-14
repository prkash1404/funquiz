class RemoveRememberDigestFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :remember_digest, :digest
  end
end
