class ChangeDisableStringToBoolean < ActiveRecord::Migration[7.1]
  def change
    rename_column :disables, :lsabout, :about
    change_column :disables, :postdisable, 'boolean USING CAST(postdisable AS boolean)'
    change_column :disables, :conversationdisable, 'boolean USING CAST(conversationdisable AS boolean)'
    change_column :disables, :homedisable, 'boolean USING CAST(homedisable AS boolean)'
    change_column :disables, :userdisable, 'boolean USING CAST(userdisable AS boolean)'
    change_column :disables, :movie, 'boolean USING CAST(movie AS boolean)'
    change_column :disables, :scene, 'boolean USING CAST(scene AS boolean)'
    change_column :disables, :credit, 'boolean USING CAST(credit AS boolean)'
    change_column :disables, :error, 'boolean USING CAST(error AS boolean)'
    change_column :disables, :expense, 'boolean USING CAST(expense AS boolean)'
    change_column :disables, :forums, 'boolean USING CAST(forums AS boolean)'
    change_column :disables, :about, 'boolean USING CAST(about AS boolean)'
    change_column :disables, :payment, 'boolean USING CAST(payment AS boolean)'
    change_column :disables, :picturescene, 'boolean USING CAST(picturescene AS boolean)'
    change_column :disables, :lionsocial, 'boolean USING CAST(lionsocial AS boolean)'
    change_column :disables, :lionfianace, 'boolean USING CAST(lionfianace AS boolean)'
    change_column :disables, :moviemaker, 'boolean USING CAST(moviemaker AS boolean)'
    change_column :disables, :tutorial, 'boolean USING CAST(tutorial AS boolean)'
    change_column :disables, :myaccont, 'boolean USING CAST(myaccont AS boolean)'
    change_column :disables, :chatrooms, 'boolean USING CAST(chatrooms AS boolean)'
    change_column :disables, :video, 'boolean USING CAST(video AS boolean)'
  end
end
