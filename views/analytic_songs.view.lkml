
view: analytic_songs {
  derived_table: {
    sql: WITH data_spotify AS (
        SELECT
          track_id,
          track_popularity as popularity,
          track_album_release_date as release_date,
          track_album_name,
          playlist_name,
          track_name,
          playlist_genre,
          danceability,
          energy,
          loudness,
          speechiness,
          instrumentalness,
          liveness,
          valence,
          acousticness,
          time as speed,
          duration_ms / 60000 as duration
        FROM top_songs_spotify
        WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) AS STRING)
          {% endcondition %}
      ), cte_year_select AS (
        SELECT AVG(track_popularity) as popularity_year_select
        FROM top_songs_spotify
        WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) AS STRING)
          {% endcondition %}
      ), cte_year_previous AS (
        SELECT AVG(track_popularity) as popularity_year_previous
        FROM top_songs_spotify
         WHERE
          {% condition select_year %}
            CAST(EXTRACT(ISOYEAR FROM track_album_release_date) + 1 AS STRING)
          {% endcondition %}
      )

      SELECT * FROM data_spotify, cte_year_select, cte_year_previous ;;
  }

  measure: count {
    type: count
  }

  dimension: track_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.track_id ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  dimension_group: release_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.release_date ;;
  }

  dimension: track_album_name {
    type: string
    sql: ${TABLE}.track_album_name ;;
  }

  dimension: playlist_name {
    type: string
    sql: ${TABLE}.playlist_name ;;
  }

  dimension: track_name {
    type: string
    sql: ${TABLE}.track_name ;;
  }

  dimension: playlist_genre {
    type: string
    sql: ${TABLE}.playlist_genre ;;
  }

  dimension: danceability {
    type: number
    sql: ${TABLE}.danceability ;;
  }

  dimension: energy {
    type: number
    sql: ${TABLE}.energy ;;
  }

  dimension: loudness {
    type: number
    sql: ${TABLE}.loudness ;;
  }

  dimension: speechiness {
    type: number
    sql: ${TABLE}.speechiness ;;
  }

  dimension: instrumentalness {
    type: number
    sql: ${TABLE}.instrumentalness ;;
  }

  dimension: liveness {
    type: number
    sql: ${TABLE}.liveness ;;
  }

  dimension: valence {
    type: number
    sql: ${TABLE}.valence ;;
  }

  dimension: acousticness {
    type: number
    sql: ${TABLE}.acousticness ;;
  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }
  measure: average_popularity {
    type: average
    sql: ${popularity} ;;
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
    sql: ${speed} ;;
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
  measure: average_duration {
    type: average
    sql: ${duration} ;;
    value_format: "#.###"
  }

  measure: live_recordings {
    type: count_distinct
    sql: ${track_name} ;;
    filters: [liveness: ">=0.8"]
  }

  measure: popularity_year_select {
    type: number
    sql: ${TABLE}.popularity_year_select ;;
    value_format: "#.##"
  }

  measure: popularity_year_previous {
    type: number
    sql: ${TABLE}.popularity_year_previous ;;
    value_format: "#.##"
  }

  measure: corr {
    type: number
    sql: corr(${duration}, ${popularity}) ;;
  }

  dimension: year {
    type: string
    sql: CAST(${release_date_year} AS STRING) ;;
  }

  filter: select_year {
    type: string
    suggest_explore: analytic_songs
    suggest_dimension: analytic_songs.year
    default_value: "2020"
    full_suggestions: yes
  }
}
