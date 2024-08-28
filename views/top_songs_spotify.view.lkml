view: top_songs_spotify {
  sql_table_name: `songs_spotify.top_songs_spotify` ;;

  dimension: track_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: acousticness {
    type: number
    sql: ${TABLE}.acousticness ;;
  }

  dimension: danceability {
    type: number
    sql: ${TABLE}.danceability ;;
  }

  dimension: duration_ms {
    type: number
    sql: ${TABLE}.duration_ms ;;
  }

  dimension: energy {
    type: number
    sql: ${TABLE}.energy ;;
  }

  dimension: instrumentalness {
    type: number
    sql: ${TABLE}.instrumentalness ;;
  }

  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  dimension: liveness {
    type: number
    sql: ${TABLE}.liveness ;;
  }

  dimension: loudness {
    type: number
    sql: ${TABLE}.loudness ;;
  }

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: playlist_genre {
    type: string
    sql: ${TABLE}.playlist_genre ;;
  }

  dimension: playlist_name {
    type: string
    sql: ${TABLE}.playlist_name ;;
  }

  dimension: playlist_subgenre {
    type: string
    sql: ${TABLE}.playlist_subgenre ;;
  }

  dimension: speechiness {
    type: number
    sql: ${TABLE}.speechiness ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension: track_album_name {
    type: string
    sql: ${TABLE}.track_album_name ;;
  }

  dimension_group: track_album_release {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.track_album_release_date ;;
  }

  dimension: album_release_year {
    type: date_month
    sql:
      CASE
        WHEN
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM ${track_album_release_date}) AS STRING)
          {% endcondition%}
        THEN
          ${track_album_release_date}
      END
    ;;
  }
  dimension: playlist_genre_year {
    type: string
    sql:
      CASE
        WHEN
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM ${track_album_release_date}) AS STRING)
          {% endcondition%}
          THEN
          ${playlist_genre}
      END
    ;;
  }


  dimension: track_artist {
    type: string
    sql: ${TABLE}.track_artist ;;
  }

  dimension: track_name {
    type: string
    sql: ${TABLE}.track_name ;;
  }

  dimension: track_popularity {
    type: number
    sql: ${TABLE}.track_popularity ;;
  }

  dimension: valence {
    type: number
    sql: ${TABLE}.valence ;;
  }

  measure: count {
    type: count
    drill_fields: [track_album_name, playlist_name, track_name]
  }
  measure: average_popularity {
    type: average
    sql: ${track_popularity} ;;
    value_format: "#.###"
  }
  measure: average_energy{
    type: average
    sql: ${energy} ;;
    value_format: "#.###"
  }
  measure: average_danceability {
    type: average
    sql: ${danceability} ;;
    value_format: "#.###"
  }
  measure: average_acousticness {
    type: average
    sql: ${acousticness} ;;
    value_format: "#.###"
  }
  measure: average_valence {
    type: average
    sql: ${valence} ;;
    value_format: "#.###"
  }
  measure: average_speed_BPM {
    type: average
    sql: ${time} ;;
    value_format: "#.###"
  }
  measure: average_liveness {
    type: average
    sql: ${liveness} ;;
    value_format: "#.###"
  }
  measure: average_instrumentalness {
    type: average
    sql: ${instrumentalness} ;;
    value_format: "#.###"
  }
  measure: average_duration_ms {
    type: average
    sql: ${duration_ms} ;;
    value_format: "#.###"
  }

  measure: corr {
    type: number
    sql: corr(${energy}, ${valence}) ;;
  }

  dimension: year {
    type: string
    sql: CAST(${track_album_release_year} AS STRING) ;;
  }

  filter: select_year {
    type: string
    suggest_explore: top_songs_spotify
    suggest_dimension: top_songs_spotify.year
    default_value: "2020"
    full_suggestions: yes
  }

}
