connection: "songs_spotify"
include: "/views/**/*.view.lkml"

datagroup: songs_spotify_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: songs_spotify_default_datagroup

explore: top_songs_spotify {}

explore: analytic_songs {
  join: top_artist {
    fields: [top_artist.artist, top_artist.album_name, top_artist.track_name]
    type: left_outer
    sql_on: ${top_artist.track_id} = ${analytic_songs.track_id} ;;
    relationship: many_to_one
  }
}
