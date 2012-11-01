class CreateMovieShows < ActiveRecord::Migration
  def change
    create_table :movie_shows do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
